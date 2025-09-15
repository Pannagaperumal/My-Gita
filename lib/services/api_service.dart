import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import '../models/verse.dart';

class ApiService {
  final String _baseUrl = "https://bhagavad-gita3.p.rapidapi.com/v2";

  // Using the correct API key you provided.
  final String _rapidApiKey = "c71c88fc8fmsh55dd814434dff5ap145646jsn42be9983a0e7";

  final String _rapidApiHost = "bhagavad-gita3.p.rapidapi.com";

  Future<List<Verse>> getChapter(int chapterNumber) async {
    if (_rapidApiKey.isEmpty) {
      throw Exception("API Key is missing.");
    }

    final response = await http.get(
      Uri.parse('$_baseUrl/chapters/$chapterNumber/verses/'),
      headers: {
        'x-rapidapi-host': _rapidApiHost,
        'x-rapidapi-key': _rapidApiKey,
      },
    );

    if (response.statusCode == 200) {
      final contentType = response.headers['content-type'];
      if (contentType != null && contentType.contains('application/json')) {
        final List<dynamic> versesData = json.decode(utf8.decode(response.bodyBytes));
        return versesData.map((data) => Verse.fromJson(data)).toList();
      } else {
        throw Exception('API returned a non-JSON response. Content-Type: $contentType');
      }
    } else {
      String errorMessage = 'Failed to load chapter $chapterNumber.';
      developer.log(
        'API Error when fetching chapter $chapterNumber.',
        name: 'com.example.myapp.api',
        error: 'Status Code: ${response.statusCode}\nBody: ${response.body}',
        level: 1000, // SEVERE
      );

      if (response.statusCode == 401 || response.statusCode == 403) {
        errorMessage += ' Invalid API Key. Please check the key in api_service.dart.';
      } else if (response.statusCode == 429) {
        errorMessage += ' You have made too many requests. Please check your API plan.';
      } else {
        errorMessage += ' Please check your network connection and the API status.';
      }
      
      throw Exception(errorMessage);
    }
  }
}
