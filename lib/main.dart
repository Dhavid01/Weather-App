import 'package:flutter/material.dart';
// import 'package:weather/core/constants/image_keys.dart';
// import 'package:weather/utils/allFunctions.dart';
import 'package:weather/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Weatherz Today', home: HomeView());
  }
}
