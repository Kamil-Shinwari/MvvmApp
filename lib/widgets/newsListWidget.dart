import 'package:flutter/material.dart';
import 'package:mvvmapp/viewModel/NewsArticeListModel.dart';
import 'package:mvvmapp/viewModel/newsArticelViewModel.dart';
import 'package:provider/provider.dart';
class NewsList extends StatelessWidget {
   final List<NewsArticleViewModel> articles;

   NewsList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<NewsArticleListViewModel>(context);
    return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(articles[index].title),
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(articles[index].imgUrl)),
            );
          },
        );
  }
}