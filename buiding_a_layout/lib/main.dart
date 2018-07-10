import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget textSection(){
      return new Container(
        padding: const EdgeInsets.all(32.0),
        child: Text('''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.'''),
      );
    }
    Widget titleSection(){
      return new Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Oeschinen Lake Campground',
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),

      );
    }
    buidButton (IconData icon , String lable){
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Text(
              lable,
              style: TextStyle(fontSize: 18.0,color: color),
            ),
          ),
        ],
      );
    }
    Widget buttonSection(){
      return new Container(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buidButton(Icons.home,'HOME'),
            buidButton(Icons.call,'CALL'),
            buidButton(Icons.share,'SHARE'),

          ],
        ),
      );
    }
    return new MaterialApp(
      home : new Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body : ListView(
          children: <Widget>[
            Image.asset(
              'images/canh.jpg',
  //            width: 600.0,
  //            height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection(),
            buttonSection(),
            textSection(),
          ],
        )
      )
    );
  }
}
