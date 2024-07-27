class WeatherIcon {
  static String getWeather(String icon) {
    return 'http://openweathermap.org/img/wn/$icon.png';
  }

  static String getWeatherBySize(String icon, String size) {
    return 'http://openweathermap.org/img/wn/$icon@$size.png';
  }
}
