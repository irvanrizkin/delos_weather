import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  final weatherApibaseUrl = '${dotenv.env['WEATHER_API_BASE_URL']}';
  final weatherApiKey = '${dotenv.env['WEATHER_API_KEY']}';
  final weatherLatitude = -6.175115064391812;
  final weatherLongitude = 106.86503923416138;
  final weatherUnits = 'metric';
}
