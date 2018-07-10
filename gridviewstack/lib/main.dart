import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MainPage extends StatefulWidget{
  final String title ;
  MainPage({this.title}):super();
  State<StatefulWidget> createState(){
    return MainPageState();
  }
}
class MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 120.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: EdgeInsets.all(5.0),
        children: buildGridTiles(12),
      )
    );
  }
  List<Widget> buildGridTiles(numberOfTiles){
    List<Stack> container;
    container = new List<Stack>.generate(numberOfTiles,
    (int index){
      // index = 0, 1, 2,...
      final imageName = index < 9 ?
      'images/anh0${index+1}.jpg':'images/anh${index+1}.jpg';
      return new Stack(
        alignment: Alignment(1.0, 1.0),
        children: <Widget>[
          new Container(
            child :Image.asset(
              imageName,
              width: 120.0,
              height: 120.0,
              fit: BoxFit.cover,
            ),
          ),
          new Container(
            decoration: new BoxDecoration(
                color: Color.fromARGB(150, 20, 50, 12)
            ),
            child: Text('${index}', style: TextStyle(fontSize: 20.0,color: Colors.blue),),
          ),

        ],
      );
    }
    );
    // ignore: return_of_invalid_type
    return container ;
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "GridView",
      // ignore: undefined_identifier
      home: MainPage(title: 'GirdView Of Images')
    );
  }
}