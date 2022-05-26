import 'package:flutter/material.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/utils/color.dart';
import 'package:weather/views/home/home_view.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
  }) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  final WeatherService _service = WeatherService();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kLightColor.withOpacity(0.2),
          ),
          margin: const EdgeInsets.all(20),
          height: 50,
          width: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width / 3),
          child: TextField(
            onSubmitted: (value) {
              value = _controller.text;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => HomeView(
                            q: value,
                          ))));
            },
            controller: _controller,
            textInputAction: TextInputAction.search,
            autofocus: true,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                suffixIcon: GestureDetector(
                    onTap: () => _controller.clear(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
                prefixIcon: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    )),
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
