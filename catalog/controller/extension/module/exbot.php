<?php

use TelegramBot\Api\Client;

class ControllerExtensionModuleExbot extends Controller {
  private $client;

  public function webhook() {
    $this->load->language('extension/module/exbot');

    $settings = $this->config->get('module_exbot_settings');
    $webhook_token = isset($settings['token']) ? $settings['token'] : '';

    if (!isset($this->request->get['token']) || $this->request->get['token'] !== $webhook_token) {
      $this->response->addHeader('HTTP/1.1 403 Forbidden');
      $this->response->setOutput('Invalid token');
      return;
    }

    $this->load->library('exbot');

    $this->client = new Client($settings['bot_token']);

    // command handlers
    $this->client->command('start', function ($message) {
      $this->handleStart($message);
    });

    $this->client->command('ping', function ($message) {
      $this->handlePing($message);
    });

    // text messages handler
    $this->client->on(function ($update) {
      $message = $update->getMessage();
      $this->handleTextMessage($message);
    }, function ($update) {
      $message = $update->getMessage();
      return $message && $message->getText() && $message->getText()[0] !== '/';
    });

    // callback query handler
    $this->client->on(function ($update) {
      $callbackQuery = $update->getCallbackQuery();
      $this->handleCallbackQuery($callbackQuery);
    }, function ($update) {
      return $update->getCallbackQuery() !== null;
    });

    // you can add more handlers here

    // run the client
    try {
      $this->client->run();
      $this->response->setOutput('OK');
    } catch (\TelegramBot\Api\Exception $e) {
      $this->log->write('Webhook handle error: ' . $e->getMessage());
      $this->response->setOutput('Error');
    }
  }

  private function handleStart($message) {
    $settings = $this->config->get('module_exbot_settings');
    $users = isset($settings['users']) && !empty($settings['users']) ? $settings['users'] : [];
    $chat_id = $message->getChat()->getId();

    if (in_array($chat_id, array_column($users, 'id'))) {
      $text = $this->language->get('text_ready');

      $keyboard = new \TelegramBot\Api\Types\Inline\InlineKeyboardMarkup(
        [
          [
            ['text' => $this->language->get('text_go'), 'callback_data' => 'confirm'],
          ]
        ]
      );

      $this->exbot->sendMessage($chat_id, $text, 'HTML', false, null, $keyboard);
    } else {
      $this->exbot->sendMessage($chat_id, sprintf($this->language->get('text_no_id'), $chat_id), 'HTML');
    }
  }

  private function handlePing($message) {
    $chat_id = $message->getChat()->getId();
    $this->exbot->sendMessage($chat_id, 'pong!');
  }

  private function handleTextMessage($message) {
    $chat_id = $message->getChat()->getId();
    $this->exbot->sendMessage($chat_id, $this->language->get('text_no_comment'));
  }

  private function handleCallbackQuery($callbackQuery) {
    $chat_id = $callbackQuery->getMessage()->getChat()->getId();
    $data = $callbackQuery->getData();

    if ($data === 'confirm') {
      $this->exbot->sendMessage($chat_id, $this->language->get('text_confirmed'));
    } else {
      $this->exbot->sendMessage($chat_id, $this->language->get('text_unknown_action'));
    }

    $this->client->answerCallbackQuery($callbackQuery->getId(), $this->language->get('text_callback_processed'));
  }
}
