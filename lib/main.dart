import 'package:flutter/material.dart';
import 'package:mvvmapp/pages/newsListPage.dart';
import 'package:mvvmapp/viewModel/NewsArticeListModel.dart';
import 'package:mvvmapp/viewModel/newsArticelViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh News",
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
      create: (context) => NewsArticleListViewModel(),
      child: NewsListPage(),
      )    );
  }
}
