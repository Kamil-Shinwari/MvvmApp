import 'package:flutter/cupertino.dart';
import 'package:mvvmapp/models/newsArticle.dart';

class NewsArticleViewModel{
  NewsArticle? _newsarticle;
  NewsArticleViewModel({NewsArticle? article}):_newsarticle=article;

  String get title{
    return _newsarticle!.title.toString();
  }
  String get description{
    return _newsarticle!.description.toString();
  }
  String get imgUrl{
    return _newsarticle!.urlToImage.toString();
  }
  String get url{
    return _newsarticle!.url.toString();
  }
}