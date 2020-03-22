import 'dart:async';
import 'dart:convert';

import 'package:corona/Model/News.dart';
import 'package:corona/Screens/News/NewsDetailPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:developer' as developer;

Future<List<News>> fetchNewsList(http.Client client) async {
  developer.log("Loading News");
  final response = await client.get('https://corona.hashmine.eu/api/news');
  developer.log("Loaded ...");
  return compute(parseNewsList, response.body);
}

List<News> parseNewsList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<News>((json) => News.fromJson(json)).toList();
}

class NewsThumbnail extends StatelessWidget {
  final News news;

  NewsThumbnail({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (news.thumbnailUrl != null)
      return Image(image: NetworkImage(news.thumbnailUrl));
    return Image(
        image: NetworkImage(
            "https://media.npr.org/assets/img/2020/03/11/c_virus_outbreak_sq-428f510423dae3e930089eb9efa735f4c6b8d9f3-s100-c85.jpg"));
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;
  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(40, 40, 40, 0.6)),
              child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 10.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.white24))),
                    child: NewsThumbnail(news: news[index]),
                  ),
                  title: Text(news[index].title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text(news[index].subtitle,
                      style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Colors.white, size: 30.0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailPage(news: news[index])),
                    );
                  }),
            ),
          );
          return Text("Trenutno ni objavljenih novic");
        },
      ),
    );
  }
}

class NewsListPage extends StatelessWidget {
  final String title;
  NewsListPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: fetchNewsList(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? NewsList(news: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
