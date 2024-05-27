import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:foodie_finder/models/restaurant.dart';
import 'package:foodie_finder/utils/constants.dart';

class RestaurantService {
  Future<List<Restaurant>> fetchRestaurants(
      double latitude, double longitude) async {
    final response = await http.get(
      Uri.parse(
          'https://openapi.naver.com/v1/search/local.json?query=맛집&display=5&start=1&sort=random&latitude=$latitude&longitude=$longitude&radius=500'),
      headers: {
        'X-Naver-Client-Id': naverClientId,
        'X-Naver-Client-Secret': naverClientSecret
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> results = json.decode(response.body)['items'];
      return results.map((data) => Restaurant.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  Future<Restaurant> getRandomRestaurant(
      double latitude, double longitude) async {
    List<Restaurant> restaurants = await fetchRestaurants(latitude, longitude);
    Random random = Random();
    return restaurants[random.nextInt(restaurants.length)];
  }
}
