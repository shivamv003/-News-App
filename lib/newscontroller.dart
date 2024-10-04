import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:news_getx/api/constand.dart';
import 'package:news_getx/api/contents.dart';  // GetX package
// import 'package:news/contents.dart';  // Your Article model class
// import 'package:news/constand.dart';  // Your API constants

class NewsController extends GetxController {
  var articles = <Article>[].obs;  // Observable list for articles
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();  // Fetch news on initialization
  }

  Future<void> fetchNews() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://gnews.io/api/v4/search?q=example&lang=en&country=in&max=10&apikey=$News_API_Key'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List articlesJson = data['articles'];

        
        articles.value = articlesJson.map((json) => Article.fromJson(json)).toList();
        isLoading.value = false;  // Stop the loading spinner
      } else {
        print('Failed to load news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching news: $e');
    }
  }
}
