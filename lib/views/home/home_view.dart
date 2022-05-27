import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/utils/color.dart';
import 'package:weather/utils/text.dart';
import 'package:weather/views/home/components/weather_image.dart';
import 'package:weather/views/search/search.dart';
import 'package:weather/widget/today_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, this.q}) : super(key: key);
  final String? q;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var selectedIndex = 0;

  final WeatherService _weatherService = WeatherService();

  Map<String, dynamic> currentData = {};
  List<Map<String, dynamic>> forecastData = [];
  bool isLoading = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => getCurrentData(widget.q));
    Future.delayed(const Duration(seconds: 2), () => getNextForecast(widget.q));

    super.initState();
  }

  getCurrentData(q) async {
    setState(() {
      isLoading = true;
    });
    currentData =
        await _weatherService.getCurrentData(q: q ?? "Benin, Nigeria");
    setState(() {
      isLoading = false;
    });
  }

  getNextForecast(q) async {
    setState(() {
      isLoading = true;
    });
    forecastData = await _weatherService.getNextForecast(q: q ?? "London");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: isLoading
              ? Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.captionMedium("Fetching Weather Report"),
                      CircularProgressIndicator()
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.yellow,
                                    size: 30,
                                  ),
                                  AppText.headingRegular(
                                    currentData["name"],
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              AppText.caption(
                                DateFormat('dd, MMMM yyyy').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        currentData["dt"] * 1000)),
                                color: Colors.white,
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchView(
                                            city: {
                                              "name": currentData["name"],
                                              "temp":
                                                  "${(currentData["main"]["temp"] - 273).truncate()}°C",
                                              "condition":
                                                  currentData["weather"][0]
                                                      ["main"]
                                            },
                                          )));
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.white, width: 1.0)),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      WeatherImage(
                          weatherCondition: currentData["weather"][0]["main"]),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: AppText.headingMeduim(
                          currentData["weather"][0]["description"],
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.headingMeduim(
                            "${(currentData["main"]["temp"] - 273).truncate()}",
                            fontSize: 100,
                            height: 1.2,
                            color: Colors.white,
                          ),
                          AppText.superScript(
                            "°C",
                            fontSize: 40,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ...List.generate(
                              ((forecastData.length) ~/ 4),
                              (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: TodayCard(
                                      color: index == selectedIndex
                                          ? kLightestColor
                                          : kLighterColor.withOpacity(0.3),
                                      time: DateFormat('kk:mm').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              forecastData[index]["dt"] *
                                                  1000)),
                                      temp:
                                          "${(forecastData[index]["main"]["temp"] - 273).truncate()}",
                                      weatherCondition: forecastData[index]
                                          ["weather"][0]["main"],
                                    ),
                                  )))
                        ]),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
