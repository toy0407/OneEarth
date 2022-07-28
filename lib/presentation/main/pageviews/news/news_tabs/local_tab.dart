import 'package:flutter/material.dart';
import 'package:one_earth/presentation/main/pageviews/news/model/article_model.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_tabs/newsListTile.dart';
import 'package:one_earth/presentation/main/pageviews/news/services/api_services.dart';

class LocalTabView extends StatelessWidget {
  final List data;
  LocalTabView({Key? key, required this.data}) : super(key: key);
  
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if(snapshot.hasData){
            List<Article>? articles = snapshot.data;

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) => 
                ListTile(
                  title: Text(articles[index].title.toString()),
                  ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      );
    // return ListView(
    //   children: [
    //     NewsListTile(
    //         heading: 'heading',
    //         description: FutureBuilder(
    //           future: client.getArticle(),
    //           builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             )
    //           },
    //         ),
    //         imageUrl: 'imageUrl'),
    //     NewsListTile(
    //         heading: 'heading',
    //         description: 'description',
    //         imageUrl: 'imageUrl'),
    //     NewsListTile(
    //         heading: 'heading',
    //         description: 'description',
    //         imageUrl: 'imageUrl'),
    //     NewsListTile(
    //         heading: 'heading',
    //         description: 'description',
    //         imageUrl: 'imageUrl'),
    //     NewsListTile(
    //         heading: 'heading',
    //         description: 'description',
    //         imageUrl: 'imageUrl'),
    //     NewsListTile(
    //         heading: 'heading',
    //         description: 'description',
    //         imageUrl: 'imageUrl'),
    //   ],
    // );
  }
}
