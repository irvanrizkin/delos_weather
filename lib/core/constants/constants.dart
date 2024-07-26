import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  final weatherApibaseUrl = '${dotenv.env['WEATHER_API_BASE_URL']}';
  final weatherApiKey = '${dotenv.env['WEATHER_API_KEY']}';
  final weatherLatitude = double.parse('${dotenv.env['WEATHER_LATITUDE']}');
  final weatherLongitude = double.parse('${dotenv.env['WEATHER_LONGITUDE']}');
  final weatherUnits = 'metric';
}
