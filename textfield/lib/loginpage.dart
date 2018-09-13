import 'package:flutter/material.dart';
import 'user.dart';
class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}
class LoginPageState extends State<LoginPage>{
  final User user = new User();
  @override
  Widget build(BuildContext context) {

    final TextField username = new TextField(
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
        labelText: 'Enter your user name',
        // ignore: argument_type_not_assignable
        contentPadding: new EdgeInsets.all(10.0),
      ),
      onChanged: (text){
        // ignore: implicit_this_reference_in_initializer
        setState(() {
          // ignore: invalid_reference_to_this
          this.user.userName=text ;
        });
      },
    );
    final TextField password = new TextField(
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
        labelText: 'Enter your password',
        // ignore: argument_type_not_assignable
        contentPadding: new EdgeInsets.all(10.0),
      ),
      obscureText: true,
      onChanged: (text){
        // ignore: implicit_this_reference_in_initializer
        setState(() {
          // ignore: invalid_reference_to_this
          this.user.password=text ;
        });
      },
    );
    final TextField email = new TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: new InputDecoration(
        labelText: 'Enter your email adress',
        // ignore: argument_type_not_assignable
        contentPadding: new EdgeInsets.all(10.0),
      ),
      onChanged: (text){
        // ignore: implicit_this_reference_in_initializer
        setState(() {
          // ignore: invalid_reference_to_this
          this.user.email=text ;
        });
      },
    );
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("TextField Demo"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin : new EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10.0),
            decoration: new BoxDecoration(
              color: Color.fromARGB(255, 240, 240, 240),
              border: new Border.all(width: 1.2 , color: Colors.black12),
              borderRadius: const BorderRadius.all(const Radius.circular(6.0)),

            ),
            child: username,
          ),
          new Container(
            margin : new EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10.0),
            decoration: new BoxDecoration(
              color: Color.fromARGB(255, 240, 240, 240),
              border: new Border.all(width: 1.2 , color: Colors.black12),
              borderRadius: const BorderRadius.all(const Radius.circular(6.0)),

            ),
            child: email,
          ),
          new Container(
            margin : new EdgeInsets.only(left: 20.0,right: 20.0),
            decoration: new BoxDecoration(
              color: Color.fromARGB(255, 240, 240, 240),
              border: new Border.all(width: 1.2 , color: Colors.black12),
              borderRadius: const BorderRadius.all(const Radius.circular(6.0)),

            ),
            child: password,
          ),
          new Container(
            // ignore: missing_identifier
            margin: new EdgeInsets.only(left: 20.0,right:20.0,bottom: 20.0,top: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: new Text("Login"),
                      onPressed: (){
                        print('user: ${user.userName}, emial : ${user.email}, password : ${user.password}');
                      },
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}