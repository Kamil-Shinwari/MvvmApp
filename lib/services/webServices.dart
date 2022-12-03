import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvmapp/models/newsArticle.dart';
import 'package:mvvmapp/utils/canstants.dart';

class Webservices {
  Future<List<NewsArticle>> fetchTopHeadLines() async {
  
    final response = await http.get(Uri.parse(Constants.TOP_HEADLLINES_URL));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }


  Future<List<NewsArticle>> fetchTopHeadLinesByKeyword(String keyword) async {
   
    final response = await http.get(Uri.parse(Constants.headlinesFor(keyword)));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
