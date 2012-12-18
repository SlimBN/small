<?php

  require_once(__dir__ . '/Spyc.php');

  class Config {
    private static $config;

    public static function init() {
      $configContents = file_get_contents(__dir__ . '/../../config.yml.php');
      $contentsArr = explode("<?php\n", $configContents);
      $yaml = $contentsArr[1];
      self::$config = Spyc::YAMLLoad($yaml);

      //self::$config = Spyc::YAMLLoad(__dir__ . "/../../config.yml.php");
    }

    public static function getConfig() {
      return self::$config;
    }

    public static function get($key) {
      if (strpos($key, '.')) {
        $exp = explode('.', $key);
        
        $out = self::$config[$exp[0]];

        for ($i = 1; $i < count($exp); $i++) {
          $out = $out[$exp[$i]];
        }
      }
      else {
        $out = self::$config[$key];
      }

      return $out;
    }
  }

  Config::init();

?>