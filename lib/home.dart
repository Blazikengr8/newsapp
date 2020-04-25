import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'newsfeeds.dart';
import 'constant.dart';

class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App",
        style: TextStyle(color: Color(0xFF1B1B1B),
        ),
      ),
        backgroundColor: Color(0xFFFFA31A),
      ),
      body:Container(
        color: Color(0xFF1B1B1B),
        child:
        GridView.count(

          crossAxisCount: 2,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new GridTile(
                child:
                new Card(
                  elevation: 10,
                  color: Color(0xFF292929),
                  child: new GestureDetector(
                    child:
                    Container(
                      child:
                      Column(
                        children: <Widget>[
                          Image.network('https://i.pinimg.com/originals/33/df/c1/33dfc12d723fe4cac19394ea5a150b26.jpg',
                            alignment: Alignment.center,
                            width: 120.0,
                            height: 120.0,
                          ),
                          new Padding(
                            padding:EdgeInsets.all(10.0),
                            child:
                            Text("Business Headlines",style: TextStyle(color: Color(0xFFFFA31A)),),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      var id=1;
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (BuildContext context)=>new NewsFeedPage(id),
                        ),);
                    },
                  ),
                )
            ),
            new GridTile(
                child:
                new Card(
                  elevation: 10,
                  color: Color(0xFF292929),
                  child: new GestureDetector(
                    child:
                    Container(
                      child:
                      Column(
                        children: <Widget>[
                          Image.network('https://i.pinimg.com/originals/e0/38/7b/e0387b9c6cc7a269ba92f92f8b8321ac.png',
                            alignment: Alignment.center,
                            width: 120.0,
                            height: 120.0,
                          ),
                          new Padding(
                            padding:EdgeInsets.all(10.0),
                            child:
                            Text("Sports Headlines",style: TextStyle(color: Color(0xFFFFA31A)),),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      var id=2;
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (BuildContext context)=>new NewsFeedPage(id),
                        ),);
                    },
                  ),
                )
            ),
            new GridTile(
                child:
                new Card(
                  elevation: 10,
                  color: Color(0xFF292929),
                  child: new GestureDetector(
                    child:
                    Container(
                      child:
                      Column(
                        children: <Widget>[
                          Image.network('https://specials-images.forbesimg.com/imageserve/5d9182dc6c7c8f000990b672/960x0.jpg?fit=scale',
                            alignment: Alignment.center,
                            width: 120.0,
                            height: 120.0,
                          ),
                          new Padding(
                            padding:EdgeInsets.all(10.0),
                            child:
                            Text("Technology Headlines",style: TextStyle(color: Color(0xFFFFA31A)),),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      var id=3;
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (BuildContext context)=>new NewsFeedPage(id),
                        ),);
                    },
                  ),
                )
            ),
            new GridTile(
                child:
                new Card(
                  elevation: 10,
                  color: Color(0xFF292929),
                  child: new GestureDetector(
                    child:
                    Container(
                      child:
                      Column(
                        children: <Widget>[
                          Image.network('https://thumbs-prod.si-cdn.com/s-jZTk0XtVmp-89MlOgFXqaAVe4=/fit-in/1600x0/https://public-media.si-cdn.com/filer/29/0f/290fb8c0-1872-46e5-8c12-235742905def/science_smithsonian_magazine_booklist_2019.png',
                            alignment: Alignment.center,
                            width: 120.0,
                            height: 120.0,
                          ),
                          new Padding(
                            padding:EdgeInsets.all(10.0),
                            child:
                            Text("Science Headlines",style: TextStyle(color: Color(0xFFFFA31A)),),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      var id=4;
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (BuildContext context)=>new NewsFeedPage(id),
                        ),);
                    },
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
