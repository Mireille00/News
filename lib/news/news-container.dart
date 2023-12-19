import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/api/api-manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

import 'new-item.dart';

class NewsContainer extends StatelessWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(source.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(onPressed: () {}, child: Text('Try Again')),
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text('Try Again')),
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewItem(
                news: newsList[index],
              );
            },
            itemCount: newsList.length,
          );
        });
  }
}