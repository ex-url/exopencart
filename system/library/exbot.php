<?php

use TelegramBot\Api\BotApi;

class Exbot {
  private $registry;
  private $bot;
  private $settings;

  public function __construct($registry) {
    $this->registry = $registry;
    $this->settings = $this->config->get('module_exbot_settings') ?: [];

    if (!empty($this->settings['bot_token'])) {
      $this->bot = new BotApi($this->settings['bot_token']);
    }
  }

  public function __get($key) {
    return $this->registry->get($key);
  }

  public function __call($method, $arguments) {
    if (!$this->bot) {
      $this->log->write('Ошибка: Токен бота не настроен.');
      return false;
    }
    try {
      return call_user_func_array([$this->bot, $method], $arguments);
    } catch (\TelegramBot\Api\Exception $e) {
      $this->log->write('Ошибка Telegram API при вызове ' . $method . ': ' . $e->getMessage());
      return false;
    }
  }

  public function setWebhook($url) {
    if (!$this->bot) {
      $this->log->write('Ошибка: Токен бота не настроен.');
      return false;
    }
    try {
      $this->bot->setWebhook($url);
      return true;
    } catch (\TelegramBot\Api\Exception $e) {
      $this->log->write('Ошибка установки вебхука: ' . $e->getMessage());
      return false;
    }
  }

  public function deleteWebhook() {
    if (!$this->bot) {
      $this->log->write('Ошибка: Токен бота не настроен.');
      return false;
    }
    try {
      $this->bot->deleteWebhook();
      return true;
    } catch (\TelegramBot\Api\Exception $e) {
      $this->log->write('Ошибка удаления вебхука: ' . $e->getMessage());
      return false;
    }
  }

  public function getWebhookInfo() {
    if (!$this->bot) {
      $this->log->write('Ошибка: Токен бота не настроен.');
      return false;
    }
    try {
      return $this->bot->getWebhookInfo();
    } catch (\TelegramBot\Api\Exception $e) {
      $this->log->write('Ошибка получения информации о вебхуке: ' . $e->getMessage());
      return false;
    }
  }
}
