import 'package:flutter/material.dart';
import 'home.dart';
import 'group.dart';
import 'chat.dart';
import 'cloud.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final tabController = new DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: AppBar(
            title: new Text("Demo tab"),
            bottom: new TabBar(
              // ignore: argument_type_not_assignable
              indicatorColor: Colors.amberAccent,
              indicatorWeight: 2.0,
              tabs: <Widget>[
                new Tab(icon : Icon(Icons.home), text:"Home"),
                new Tab(icon : Icon(Icons.group),text: "Group",),
                new Tab(icon : Icon(Icons.chat_bubble),text: "Chat"),
                new Tab(icon : Icon(Icons.cloud_queue),text: "Cloud",)

              ],
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              Home(),
              Group(),
              Chat(),
              Cloud()
            ],
          ),
        )
    );
    return MaterialApp(
      title: "",
      home: new Scaffold(
        body: tabController,
      ),
    );
  }
}