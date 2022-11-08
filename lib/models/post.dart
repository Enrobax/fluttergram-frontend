import 'dart:convert';

import 'package:fluttergram/models/user.dart';

class Post {
  int? id;
  User? user;
  String? position;
  String? text;
  String? url1;
  Null? url2;
  Null? url3;
  Null? url4;
  Null? url5;

  Post(
      {this.id,
        this.user,
        this.position,
        this.text,
        this.url1,
        this.url2,
        this.url3,
        this.url4,
        this.url5});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    position = json['position'];
    text = json['text'];
    url1 = json['url1'];
    url2 = json['url2'];
    url3 = json['url3'];
    url4 = json['url4'];
    url5 = json['url5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['position'] = this.position;
    data['text'] = this.text;
    data['url1'] = this.url1;
    data['url2'] = this.url2;
    data['url3'] = this.url3;
    data['url4'] = this.url4;
    data['url5'] = this.url5;
    return data;
  }

  List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

  String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

