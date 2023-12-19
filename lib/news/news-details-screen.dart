import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../my-Theme.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'news-details';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.greyColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.title ?? "",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.publishedAt ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.greyColor),
              textAlign: TextAlign.end,
            ),
            SizedBox(
              height: 30,
            ),
            Text(news.content ?? ''),
            SizedBox(
              height: 70,
            ),
            InkWell(
              onTap: () => launchNewsUrl(news.url ?? ''),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('View full article'),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchNewsUrl(String url) async {
    var uri = Uri.parse(url);
    await launchUrl(uri);
  }
}
