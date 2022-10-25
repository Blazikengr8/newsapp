import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

import 'constant.dart';
import 'description.dart';
class NewsFeedPage extends StatelessWidget {
  NewsFeedPage(this.text);
  final int text;

  @override
  Widget build(BuildContext context) {
    String title;
    if(text==1)
      title="Business";
    else if(text==2)
      title="Sports";
    else if(text==3)
      title="Technology";
    else if(text==4)
      title="Science";
    return Scaffold(
      appBar: AppBar(
        title: Text("$title Headlines",style: TextStyle(color: Color(0xFF292929)),),
        backgroundColor: Color(0xFFFFA31A),
        iconTheme: IconThemeData(color: Color(0xFF292929)),
      ),
      body: Container(
      color: Color(0x1B1B1B),
      child:
       Column(
        children: <Widget>[
          new Expanded(
            flex: 1,
             child:
              Container(
                color: Color(0xFF1B1B1B),
                child:
                GestureDetector(
                  child:
                    new FutureBuilder<List<News>>(
                      future: fatchNews(
                        http.Client(),text),
                      builder: (context,snapshot){
                        if(snapshot.hasError)print(snapshot.error);

                        return snapshot.hasData
                            ? NewsList(news: snapshot.data)
                            : Center(child:CircularProgressIndicator());
                      },
                      ),
                    )
                ),
              )
          ],
      ),
    ),
    );
  }
}
Future<List<News>> fatchNews(http.Client client,id) async {
  String url;
  if(id==1){
    url = Constant.base_url +
        "top-headlines?country=in&category=business&apiKey=" +
        Constant.key;
  }
  else if(id==2)
    {
      url = Constant.base_url +
          "top-headlines?country=in&category=sports&apiKey=" +
          Constant.key;
    }
  else if(id==3)
    {
      url = Constant.base_url +
          "top-headlines?country=in&category=technology&apiKey=" +
          Constant.key;
    }
  else if(id==4) {
    url = Constant.base_url +
        "top-headlines?country=in&category=Science&apiKey=" +
        Constant.key;
  }
  final response = await client.get(url);
  return compute(parsenews, response.body);
}
List<News> parsenews(String responsebody) {
  final parsed = json.decode(responsebody);
  return (parsed["articles"] as List)
      .map<News>((json) => new News.fromJson(json))
      .toList();
}

class News {
  String auther;
  String title;
  String description;
  String url;
  String imgurl;

  News({this.auther, this.title, this.description, this.url, this.
  imgurl, image});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      auther: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imgurl:json['urlToImage'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
       // String image=(news[index].imgurl!=null)?news[index].imgurl:'https://cdn4.vectorstock.com/i/1000x1000/37/53/bite-apple-sign-orange-icon-on-black-background-vector-13393753.jpg';
        return new Card(
          color: Color(0xFF292929),
          child: new ListTile(
            leading:
            Image.network(news[index].imgurl,),
            title: Text(news[index].title,style: TextStyle(color: Color(0xFFFFA31A),),),

            onTap: () {
              var url = news[index].url;
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DescriptionPage(url),
                  ));
            },
          ),
        );
      },
    );
  }
}
