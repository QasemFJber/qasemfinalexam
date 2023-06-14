import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiManager {
  final String apiUrl;
  static ApiManager? _instance;

  ApiManager._internal(this.apiUrl);

  static ApiManager? getInstance(String apiUrl) {
    _instance ??= ApiManager._internal(apiUrl);
    return _instance;
  }

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
