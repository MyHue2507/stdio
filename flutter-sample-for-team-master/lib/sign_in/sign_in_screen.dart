import 'package:flutter/material.dart';
import 'package:sample_for_team/app_bloc.dart';
import 'package:sample_for_team/app_state.dart';
import 'package:sample_for_team/home/home.dart';

class SignInScreen extends StatefulWidget {
  final AppBloc appBloc;

  const SignInScreen({Key key, this.appBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignInScreen> {
  TextEditingController _userNameTextController;
  TextEditingController _passwordTextController;
  var _key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _userNameTextController = new TextEditingController();
    _passwordTextController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Text(
                "Please login ! ",
                style: TextStyle(fontSize: 30.0),
              ),
              TextField(
                controller: _userNameTextController,
                decoration: InputDecoration(hintText: "User name"),
              ),
              TextField(
                controller: _passwordTextController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                obscureText: true,
              ),
              FlatButton(
                onPressed: () {
                  if (_userNameTextController.text.isNotEmpty &&
                      _passwordTextController.text.isNotEmpty) {
                    // nhap du 2 fields
                    widget.appBloc.updateUser(
                        AppState(userName: _userNameTextController.text));
                  } else {
                    _key.currentState.showSnackBar(SnackBar(
                      content: Text("Hay nhap du thong tin"),
                    ));
                    // chua thoa man
                  }
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
