import 'package:flutter/material.dart';
import 'newsfeeds.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(new DescriptionPage(null));

class DescriptionPage extends StatelessWidget {
  static String tag = 'description-page';
  DescriptionPage(this.urlnews);
  final String urlnews;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Full Article",
          style: new TextStyle(color: Color(0xFF292929)),
        ),
        iconTheme: IconThemeData(color: Color(0xFF292929)),
        backgroundColor: Color(0xFFFFA31A),
      ),
      body: Container(
        color: Color(0xFF292929),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebviewScaffold(
          url: urlnews,
        ),
      ),
    );
  }
}