
import 'package:flutter/material.dart';
import 'package:weather/utils/text.dart';

class CitiesCard extends StatelessWidget {
  const CitiesCard(
      {Key? key,
      required this.color,
      required this.name,
      required this.condition,
      required this.temp})
      : super(key: key);

  final Color color;
  final String name;
  final String condition;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AppText.headingRegular(temp),
                  AppText.headingMeduim(condition),
                ],
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 40),
                child: Image.asset(
                  "assets/sunny.png",
                ),
              ),
            ],
          ),
          AppText.headingRegular(name)
        ],
      ),
    );
  }
}
