import 'package:flutter/material.dart';
import 'package:weather/core/constants/image_keys.dart';
import 'package:weather/core/constants/weathercondition_keys.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    Key? key,
    required this.weatherCondition,
  }) : super(key: key);
  final String weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(      
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 250),
        child: Image.asset(
          weatherCondition == WeatherKeys.rainy
              ? Images.rainy
              : weatherCondition == WeatherKeys.cloudy
                  ? Images.cloudy
                  : weatherCondition == WeatherKeys.clear
                      ? Images.clear
                      : Images.cloudy,
        ),
      ),
    );
  }
}
