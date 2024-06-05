import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpDataService {
  Future<Map<String, dynamic>> fetchJsonData(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return data;
    } else {
      // Handle error: throw an exception or log an error message
      throw Exception('Failed to fetch data from URL: $url (Status code: ${response.statusCode})');
    }
  }
}