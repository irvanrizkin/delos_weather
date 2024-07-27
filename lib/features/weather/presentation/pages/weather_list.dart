import 'package:delos_weather/core/utils/weather_icon.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_bloc.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_state.dart';
import 'package:delos_weather/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Weather App',
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }

  _buildBody () {
    return BlocBuilder<RemoteWeatherBloc, RemoteWeatherState>(
      builder: (_, state) {
        if (state is RemoteWeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemoteWeatherError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is RemoteWeatherDone) {
          return ListView.separated(
            itemCount: state.weathers!.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  WeatherIcon.getWeather(state.weathers![index].weather?.first.icon ?? ''),
                ),
                title: Text(
                  DateFormatter.formatUnixDate(
                    state.weathers![index].dt ?? 0,
                    'EEE, MMM d, yyyy h:mm a',
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${state.weathers![index].weather?.first.main}'),
                    Text('Temp: ${state.weathers![index].main?.temp}'),
                  ],
                ),
                onTap: () {
                  context.go(
                    '/detail',
                    extra: state.weathers![index],
                  );
                },
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
