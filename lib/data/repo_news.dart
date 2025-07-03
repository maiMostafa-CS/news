import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import '../model/model.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) => NewsRepository());

class NewsRepository {
  final String _endpoint =
      'https://newsapi.org/v2/everything?q=apple&from=2025-07-01&to=2025-07-01&sortBy=popularity&apiKey=5b763408bea84ba787d248c336e31ec1';
  Future<NewsModel> fetchNews() async {
    final response = await http.get(Uri.parse(_endpoint));
    if (response.statusCode == 200) {
      print('Response: ${response.body}');

      return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load newsScreen.dart');
    }
  }
}