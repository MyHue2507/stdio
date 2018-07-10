import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var card = new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading : Icon(Icons.account_box,color: Colors.blue),
            title: Text("Stdio Hue"),
            // ignore: argument_type_not_assignable
            subtitle: new Text("Dịch vị kỹ thuật tại Huế"),
          ),
          new Divider(color: Colors.blue,indent: 50.0),
          new ListTile(
            leading: Icon(Icons.email,color: Colors.blue),
            title: Text("stdio.hue@gmail.com"),
          ),
          new Divider(color: Colors.blue,indent: 50.0),
          new ListTile(
            leading: Icon(Icons.phone,color: Colors.blue),
            title: Text("0123456789"),
          ),
        ],
      ),
    );
    var boxSize = new Container(
      margin: EdgeInsets.only(left: 12.0,right: 12.0),
      child: new SizedBox(
        height: 250.0,
        width: 350.0,
        child: card,
      ),
    );
    var center = new Center(
      child: boxSize,
    );
    // ignore: not_enough_required_arguments
    final GlobalKey<ScaffoldState> scaffolKey = new GlobalKey<ScaffoldState>();
    showSnackBar(){
      // ignore: argument_type_not_assignable
      final snackbar = new SnackBar(
        content: new Text("huestdio.com"),
        duration: Duration(seconds: 10),
        action: new SnackBarAction(
            label: "OK",
            onPressed: (){
        }),
      );
      scaffolKey.currentState.showSnackBar(snackbar);
    }
    // TODO: implement build
    return new MaterialApp(
      title: "",
      home: new Scaffold(
        key: scaffolKey,
        appBar: AppBar(
          // ignore: argument_type_not_assignable
          title: new Text("Stdio Card"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.info),
              onPressed: showSnackBar
            ),
          ],
        ),
        body: center,
      ),
    );
  }
}