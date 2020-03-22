import 'package:intl/intl.dart';

class News {
  final String uuid;
  final DateTime date;
  final String title;
  final String subtitle;
  final String content;
  final String author;
  final String thumbnailUrl;
  final String url;

  News({this.uuid, this.date, this.title, this.subtitle, this.content, this.author, this.thumbnailUrl, this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    return News(
      uuid: json['uuid'] as String,
      date: dateFormat.parse(json['date']),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      url: json['url'] as String,
    );
  }
}