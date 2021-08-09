import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_response.dart';

const _BASE_URL = 'https://newsapi.org/v2';
const _API_KEY = '642c761941314601b682b206af8aacaf';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vial, 'science'),
    Category(FontAwesomeIcons.footballBall, 'sports'),
    Category(FontAwesomeIcons.microchip, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();
    categories.forEach(
      (element) {
        this.categoryArticles[element.label] = [];
      },
    );
  }

  String get selectedCategory => this._selectedCategory;
  set selectedCategory(String value) {
    this._selectedCategory = value;

    this.getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get getArticlesBySelectedCategory =>
      this.categoryArticles[this.selectedCategory]! ;

  getTopHeadlines() async {
    final url = '$_BASE_URL/top-headlines?apiKey=$_API_KEY&country=ar';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = NewsResponse.fromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.length > 0) {
      return this.categoryArticles[category];
    }
    final url =
        '$_BASE_URL/top-headlines?apiKey=$_API_KEY&country=ar&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = NewsResponse.fromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);

    this.categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
