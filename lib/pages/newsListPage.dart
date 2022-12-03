

import 'package:flutter/material.dart';
import 'package:mvvmapp/viewModel/NewsArticeListModel.dart';
import 'package:mvvmapp/widgets/newsListWidget.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();
  NewsArticleListViewModel _articleListViewModel = NewsArticleListViewModel();

@override
  void initState() {
    // TODO: implement initState
    Provider.of<NewsArticleListViewModel>(context,listen: false)
    .populateTopHeadLines();
    super.initState();

   
  }

   Widget _buildList(NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
        break;

      case LoadingStatus.completed:
        // TODO: Handle this case.
        return Expanded(
            child: NewsList(
          articles: vm.article,
        ));

        break;
      case LoadingStatus.empty:
        // TODO: Handle this case.
        return Align(
          child: Text("No results found"),
        );
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          TextField(controller: _controller,
          onSubmitted: (value){
            if(value.isNotEmpty){
              vm.search(value);
            }
          },
         decoration: InputDecoration(labelText: "Enter search Term",
         icon: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Icon(Icons.search),
         ),
         suffixIcon: IconButton(icon: Icon(Icons.clear),onPressed: (){
          _controller.clear();
         },)
         ),
          
          ),
         
         _buildList(vm),
        ],)
      ),
    );
  }
}
