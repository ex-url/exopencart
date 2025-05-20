<?php

use TelegramBot\Api\Client;

class ControllerExtensionModuleExbot extends Controller {
  private $client;

  public function webhook() {
    $settings = $this->config->get('module_exbot_settings');
    $webhook_token = isset($settings['token']) ? $settings['token'] : '';

    if (!isset($this->request->get['token']) || $this->request->get['token'] !== $webhook_token) {
      $this->response->addHeader('HTTP/1.1 403 Forbidden');
      $this->response->setOutput('Invalid token');
      return;
    }

    $this->load->library('exbot');

    $this->client = new Client($settings['bot_token']);

    $this->client->command('start', function ($message) {
      $this->handleStart($message);
    });

    $this->client->command('ping', function ($message) {
      $this->handlePing($message);
    });

    $this->client->on(function ($update) {
      $message = $update->getMessage();
      $this->handleTextMessage($message);
    }, function ($update) {
      $message = $update->getMessage();
      return $message && $message->getText() && $message->getText()[0] !== '/';
    });

    try {
      $this->client->run();
      $this->response->setOutput('OK');
    } catch (\TelegramBot\Api\Exception $e) {
      $this->log->write('Ошибка обработки вебхука: ' . $e->getMessage());
      $this->response->setOutput('Error');
    }
  }

  private function handleStart($message) {
    $settings = $this->config->get('module_exbot_settings');
    $users = isset($settings['users']) && !empty($settings['users']) ? $settings['users'] : [];
    $chat_id = $message->getChat()->getId();

    if (in_array($chat_id, array_column($users, 'id'))) {
      $this->exbot->sendMessage($chat_id, 'Работаем 😉');
    } else {
      $this->exbot->sendMessage($chat_id, 'Ваш ID отсутствует в списке получателей уведомлений. Обратитесь к администратору сервиса. Кстати, ваш ID - <code>' . $chat_id . '</code>', 'HTML');
    }
  }

  private function handlePing($message) {
    $chat_id = $message->getChat()->getId();
    $this->exbot->sendMessage($chat_id, 'pong!');
  }

  private function handleTextMessage($message) {
    $chat_id = $message->getChat()->getId();
    $this->exbot->sendMessage($chat_id, 'Ой, это я не могу комментировать');;
  }
}
