import 'package:bigdeals2/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bigdeals2/tabs/tabs.dart';

class LoggedScreen extends StatefulWidget {
  final AppBloc appBloc;
  LoggedScreen({Key key, this.appBloc}) : super(key: key);
  @override
  LoggedScreenState createState() {
    return LoggedScreenState();
  }
}

class LoggedScreenState extends State<LoggedScreen> {
  @override
  buildRow(String text) {
    return Container(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(text),
                  Icon(Icons.chevron_right),
                ],
              ),
            );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(150, 7, 239, 204),
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 120.0, right: 120.0, top: 30.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.w3schools.com/howto/img_forest.jpg"),
              radius: 60.0,
            ),
          ),
          Container(
            height: 50.0,
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder : (context) => ChangePassWord(appBloc: widget.appBloc,)));
                },
                child: buildRow('Change password'),
              ),
            ),
          ),
          Container(
            height: 50.0,
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder : (context) => MyAddress()));
                },
                child: buildRow('My Address'),
              ),
            ),
          ),
          Container(
            height: 50.0,
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: Card(
              child: InkWell(
                onTap: (){
//                  Navigator.push(context, MaterialPageRoute(builder : (context) => OrdersHistory()));
                },
                child: buildRow('Orders History'),
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: FlatButton(
                child: Text(
                  'Đăng xuất',
                  style:
                      TextStyle(height: 0.0, fontSize: 20.0, color: Colors.red),
                ),
                onPressed: () {
                  widget.appBloc.dangXuat();
                },
              ),
              onTap: null,
            ),
          )
        ],
      ),
    );
  }
}
