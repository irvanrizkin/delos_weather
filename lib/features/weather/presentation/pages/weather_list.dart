import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_bloc.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_event.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_state.dart';
import 'package:delos_weather/features/weather/presentation/widgets/weather_list/weather_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.weatherApp,
        style: const TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    AppLocalizations.of(context)!.selectCity,
                  ),
                  content: setupCityList(context),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _buildBody (BuildContext context) {
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
              return WeatherTile(
                unixTime: state.weathers![index].dt ?? 0,
                weather: state.weathers![index].weather?.first.main ?? '',
                temperatureLabel: AppLocalizations.of(context)!.temp,
                temperature: state.weathers![index].main?.temp ?? 0,
                icon: state.weathers![index].weather?.first.icon ?? '',
                onTap: () {
                  context.push(
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

  Widget setupCityList(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: ListView.builder(
      itemCount: context.read<RemoteWeatherBloc>().cities.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(context.read<RemoteWeatherBloc>().cities[index].name),
          onTap: () {
            context.read<RemoteWeatherBloc>().add(
              GetWeatherByCity(
                context.read<RemoteWeatherBloc>().cities[index].name,
                context.read<RemoteWeatherBloc>().cities[index].latitude,
                context.read<RemoteWeatherBloc>().cities[index].longitude,
              ),
            );
            Navigator.pop(context);
          },
        );
        },
      )
    );
  }
}
