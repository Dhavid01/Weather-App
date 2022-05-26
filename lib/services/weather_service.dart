import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String hostKey = "community-open-weather-map.p.rapidapi.com";
  final String apiKey = "1dc631ab02msh639a6704b47baa4p1374d4jsna3a2ec64c5bc";
  final String host = "X-RapidAPI-Host";
  final String api = "X-RapidAPI-Key";
  final baseURL = "https://community-open-weather-map.p.rapidapi.com";

  Future<Map<String, dynamic>> getCurrentData({
    required String? q,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/weather?q=$q ",
        ),
        headers: {
          host: hostKey,
          api: apiKey,
        },
      );
      // ignore: avoid_print
      print(response);
      // ignore: avoid_print
      print("here now");
      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      // ignore: avoid_print
      print("Error is $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getNextForecast({
    required String? q,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "$baseURL/forecast?q=$q",
        ),
        headers: {
          host: hostKey,
          api: apiKey,
        },
      );

      final data = jsonDecode(response.body)["list"];
      // print(data);
      final List<Map<String, dynamic>> forecastList =
          List<Map<String, dynamic>>.from(
        data.map((e) => e),
      );
      return forecastList;
    } catch (e) {
      // ignore: avoid_print
      print("Error is $e");
      rethrow;
    }
  }
}
