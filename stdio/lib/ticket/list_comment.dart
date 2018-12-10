import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ListComment extends StatefulWidget {
  DataSnapshot dataSnapshot ;
  Animation animation ;
  ListComment({Key key, this.dataSnapshot, this.animation}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListCommentState();
  }
}
class ListCommentState extends State<ListComment> {
  _commentItem(DataSnapshot dataSnapshot, Animation animation) {
    return Row(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(dataSnapshot.value['senderPhotoUrl']),
            )),
            Container(
                  // color: Colors.blue,
                  child: Text(
                    dataSnapshot.value['content'],
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue),
                  margin: EdgeInsets.only(left: 10.0),
                ),
                
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _commentItem(widget.dataSnapshot, widget.animation);
  }
}
