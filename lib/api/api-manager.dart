import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api-constants.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=b5085c250c5b46889d04a7a8a2ea93a3
   */
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi, {
      'apiKey': 'b5085c250c5b46889d04a7a8a2ea93a3', //key:value
      'category': categoryId,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body; //string
      var json = jsonDecode(bodyString); //string to json
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    /*
   https://newsapi.org/v2/everything?q=bitcoin&apiKey=b5085c250c5b46889d04a7a8a2ea93a3
    */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {'apiKey': 'b5085c250c5b46889d04a7a8a2ea93a3', 'sources': sourceId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> searchNews(String query) async {
    /*
   https://newsapi.org/v2/everything?q=bitcoin&apiKey=b5085c250c5b46889d04a7a8a2ea93a3
    */
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {'apiKey': 'b5085c250c5b46889d04a7a8a2ea93a3', 'q': query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
