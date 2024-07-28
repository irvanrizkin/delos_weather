abstract class RemoteWeatherEvent {
  const RemoteWeatherEvent();
}

class GetWeathers extends RemoteWeatherEvent {
  const GetWeathers();
}

class GetWeatherByCity extends RemoteWeatherEvent {
  final String city;
  final double latitude;
  final double longitude;
  
  const GetWeatherByCity(this.city, this.latitude, this.longitude);
}
