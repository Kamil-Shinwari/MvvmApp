import 'package:flutter/cupertino.dart';
import 'package:mvvmapp/models/newsArticle.dart';
import 'package:mvvmapp/services/webServices.dart';
import 'package:mvvmapp/viewModel/newsArticelViewModel.dart';


enum LoadingStatus{
  completed,
  searching,
  empty
}
class NewsArticleListViewModel extends ChangeNotifier{
  List<NewsArticleViewModel> article = <NewsArticleViewModel>[];
  var loadingStatus = LoadingStatus.searching;

  // NewsArticleListViewModel(){
  //   _populateTopHeadLines();
  // }
  void populateTopHeadLines() async{
    this.loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticle = await Webservices().fetchTopHeadLines();
    this.article = newsArticle.map((e) => NewsArticleViewModel(article: e)).toList();
     this.loadingStatus =
        this.article.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

 Future<void> search(String keyword) async {
  this.loadingStatus = LoadingStatus.searching;
  notifyListeners();
  List<NewsArticle> newsArticle = await Webservices().fetchTopHeadLinesByKeyword(keyword);
  this.article = newsArticle.map((e) => NewsArticleViewModel(article: e)).toList();
  this.loadingStatus = this.article.isEmpty? LoadingStatus.empty:LoadingStatus.completed;
  notifyListeners();
 }
}