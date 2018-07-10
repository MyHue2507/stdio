import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}
class MainPageState extends State<MainPage>{
  var title ='';
  Drawer buildDrawer(){
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: new BoxDecoration(color: Colors.blue),
            child: new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Image.asset(
                    'images/stdio.jpg',
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.cover
                  ),
                  new Text("Stdio Huế",style: new TextStyle(fontSize: 25.0 , color: Colors.black,fontWeight: FontWeight.bold)),
                  new Text("143/27A Phan Bội Châu",style: new TextStyle(fontSize: 20.0,color: Colors.black))
                ],
              ),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.photo),
            title: new Text("Photos"),
            onTap: (){
              setState(() {
                this.title= "Photos";
              });
              Navigator.pop(context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.video_call),
            title: new Text("Video"),
            onTap: (){
              setState(() {
                this.title= "Video";
              });
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Drawer Demo"),
      ),
      body: new Center(
        child : new Text(this.title,style: TextStyle(fontSize: 20.0)),
      ),
      drawer: buildDrawer(),
    );
  }
}