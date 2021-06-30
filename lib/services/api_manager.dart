import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yt_newsapp_restapi/constants/strings.dart';
import 'package:yt_newsapp_restapi/models/news_model.dart';

class ApiManager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response =
          await client.get(Uri.parse(Strings.newsUrl + Strings.newsApi));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
