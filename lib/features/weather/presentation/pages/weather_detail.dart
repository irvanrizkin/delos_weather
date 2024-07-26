import 'package:flutter/material.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({ super.key });

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

  _buildBody() {
    return const Center(
      child: Text('Weather Detail'),
    );
  }
}
