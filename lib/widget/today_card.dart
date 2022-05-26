import 'package:flutter/material.dart';
import 'package:weather/core/constants/image_keys.dart';
import 'package:weather/core/constants/weathercondition_keys.dart';
import 'package:weather/utils/text.dart';

class TodayCard extends StatelessWidget {
  const TodayCard(
      {Key? key,
      required this.color,
      required this.time,
      required this.temp,
      required this.weatherCondition})
      : super(key: key);

  final Color color;
  final String time;
  final String temp;
  final String weatherCondition;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      margin: const EdgeInsets.only(left: 15),
      
      width: 100,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              weatherCondition == WeatherKeys.rainy
                  ? Images.rainy
                  : weatherCondition == WeatherKeys.cloudy
                      ? Images.cloudy
                      : weatherCondition == WeatherKeys.clear
                          ? Images.clear
                          : Images.cloudy,
            ),
            const SizedBox(
              height: 10,
            ),
            AppText.headingMeduim(time),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.headingRegular(temp),
                AppText.superScript(
                  "°C",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
