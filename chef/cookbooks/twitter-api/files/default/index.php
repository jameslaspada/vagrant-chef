<?php
ini_set('display_errors', 1);
require_once('TwitterAPIExchange.php');

/** Set access tokens here - see: https://dev.twitter.com/apps/ **/
$settings = array(
    'oauth_access_token' => "2859721341-gMX8QYTAOnEm67IxHJbf3OtBgIaRVjAkz0IUz5V",
    'oauth_access_token_secret' => "rD0zXUUoAnCfhkLINLEurqv4t0862d8Qbm54Yxvz9BaaC",
    'consumer_key' => "lpY0JDNeB17uO3rlEUXR1L1dv",
    'consumer_secret' => "ZT0TpTo65vqk8DE6v3PymJL8V0qImGWoZWigi9ZllFUUmhcXA4"
);

$url = 'https://api.twitter.com/1.1/statuses/user_timeline.json';
$getfield = '?screen_name=jimsarduino&count=1';
$requestMethod = 'GET';
$twitter = new TwitterAPIExchange($settings);
/** echo $twitter->setGetfield($getfield)
              ->buildOauth($url, $requestMethod)
             ->performRequest(); **/

$string = json_decode($twitter->setGetfield($getfield)
->buildOauth($url, $requestMethod)
->performRequest(),$assoc = TRUE);

foreach ($string as $items){

  echo $items['text'];
}

?>
