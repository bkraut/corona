import 'dart:async';
import 'dart:convert';

import 'package:corona/Model/News.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:developer' as developer;

class NewsImage extends StatelessWidget {
  final News news;
  NewsImage({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
          'https://dfcby4322olzt.cloudfront.net/wp-content/uploads/2020/03/1800x1200_coronavirus_1-336x224.jpg',
          fit: BoxFit.fitWidth)
    );
  }
}

class NewsSubtitle extends StatelessWidget {
  final News news;
  NewsSubtitle({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          news.subtitle,
          style: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
      ),
    );
  }
}

class NewsAuthor extends StatelessWidget {
  final News news;
  NewsAuthor({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Avtor:" + news.subtitle,
          style: TextStyle(fontSize: 12.0, color: Colors.white),
        ),
      ),
    );
  }
}

class NewsContent extends StatelessWidget {
  final News news;
  NewsContent({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          news.content,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

loadSourceUrl(String url) async {
  if (url != null) {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class NewsShare extends StatelessWidget {
  final News news;
  NewsShare({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton.icon(
              color: Colors.red,
              icon: Icon(Icons.link), //`Icon` to display
              label: Text('Vir'), //`Text` to display
              onPressed: () => loadSourceUrl(news.url),
          ),
          FlatButton.icon(
              color: Colors.orange,
              icon: Icon(Icons.share), //`Icon` to display
              label: Text('Deli'), //`Text` to display
              onPressed: () {
                final RenderBox box = context.findRenderObject();
                Share.share(news.url,
                    sharePositionOrigin:
                    box.localToGlobal(Offset.zero) &
                    box.size);
              }),
          FlatButton.icon(
              color: Colors.amber,
              icon: Icon(Icons.comment), //`Icon` to display
              label: Text('Komentiraj'), //`Text` to display
              onPressed: () {
                //Code to execute when Floating Action Button is clicked
                //...
              }),
        ],
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final News news;
  NewsDetailPage({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('Assets/image2.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(news.title),
          backgroundColor: Color.fromRGBO(80, 80, 80, 0.8),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Card(
              color: Color.fromRGBO(80, 80, 80, 0.8),
              elevation: 8.0,
              margin:
                  new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: <Widget>[
                  NewsImage(news: this.news),
                  SizedBox(height: 10),
                  NewsSubtitle(news: this.news),
                  SizedBox(height: 10),
                  NewsAuthor(news: this.news),
                  SizedBox(height: 10),
                  NewsContent(news: this.news),
                  NewsShare(news: this.news),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
