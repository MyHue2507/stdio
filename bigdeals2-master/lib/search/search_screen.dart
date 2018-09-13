import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return SearchScreenState();
    }
}
class SearchScreenState extends State<SearchScreen>{
  TextEditingController _searchTextController;
  @override
  void initState() {
    super.initState();
    _searchTextController = new TextEditingController();
  }
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
      backgroundColor: Color.fromARGB(150, 7, 239, 204),
      title: Directionality(
          textDirection: Directionality.of(context),
          child: TextField(
            key: Key('SearchBarTextField'),
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black, fontSize: 16.0),
            decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: new TextStyle(color: Colors.grey, fontSize: 16.0),
                border: null),
            onChanged: null,
            autofocus: true,
            controller: _searchTextController,
          )),
      actions: [
        new IconButton(
            icon: new Icon(Icons.clear, color: Colors.red),
            onPressed: () {
              _searchTextController.clear();
            })
      ],
    ),
      );
    }
}