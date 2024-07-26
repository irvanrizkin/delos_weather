import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_bloc.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_event.dart';
import 'package:delos_weather/features/weather/presentation/pages/weather_list.dart';
import 'package:delos_weather/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteWeatherBloc>(
      create: (context) => sl()..add(const GetWeathers()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherList()
      ),
    );
  }
}
