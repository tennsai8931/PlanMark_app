import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static String get baseUrl {
    final apiBaseUrl = dotenv.env['API_BASE_URL'];

    if (apiBaseUrl == null || apiBaseUrl.isEmpty) {
      throw Exception('API_BASE_URL is not set');
    }

    return '$apiBaseUrl/api';
  }

  static Future<List<dynamic>> getPoints() async {
    final response = await http.get(
      Uri.parse('$baseUrl/points/'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load points');
    }
  }

  static Future<void> createPoint({
    required String name,
    required double x,
    required double y,
    String note = '',
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/points/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'x': x,
        'y': y,
        'note': note,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create point');
    }
  }
}