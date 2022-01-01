import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bigo_task/globals.dart';
import 'package:bigo_task/models/HomeModel.dart';

class ApiService {
  static Future<List<HomeModel>> fetchHouses() async {
    final response = await http.get(Uri.parse(globals.apiUrl + 'houses'));
    if (response.statusCode == 200) {
      var items = jsonDecode(response.body);
      List<HomeModel> houses = [];

      items.forEach((item) {
        houses.add(HomeModel.fromJson(item));
      });

      return houses;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
