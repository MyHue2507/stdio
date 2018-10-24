import 'package:bigdeals2/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:bigdeals2/app_bloc.dart';

class ProfileScreen extends StatefulWidget {
  final AppBloc appBloc;
  ForgotPass forgotPass ;
  ProfileScreen({Key key, this.appBloc,this.forgotPass}) : super(key: key);

  @override
  ProfileScreenState createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  int counter = 1;
  TextEditingController _userNameLoginTextController;
  TextEditingController _passwordLoginTextController;

  TextEditingController _userNameRegisterTextController;
  TextEditingController _passwordRegisterTextController;
  TextEditingController _comfirmRegisterPasswordsTextController;
  var _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _userNameLoginTextController = new TextEditingController();
    _passwordLoginTextController = new TextEditingController();
    _userNameRegisterTextController = new TextEditingController();
    _passwordRegisterTextController = new TextEditingController();
    _comfirmRegisterPasswordsTextController = new TextEditingController();
  }

  Widget login() {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Container(
          height: 500.0,
          width: 300.0,
          decoration: new BoxDecoration(color: Colors.white),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    height: 50.0,
                    minWidth: 100.0,
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        counter = 1;
                      });
                    },
                  ),
                  MaterialButton(
                    height: 50.0,
                    minWidth: 100.0,
                    child: Text('Đăng kí', style: TextStyle(fontSize: 25.0)),
                    color: Colors.white30,
                    onPressed: (() {
                      setState(() {
                        counter = 2;
                      });
                    }),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 30.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _userNameLoginTextController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Email',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 15.0),
                child: TextField(
                  controller: _passwordLoginTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(200.0, 10.0, 0.0, 0.0),
                child: FlatButton(
                  child: Text('Quên mật khẩu?',
                      style: TextStyle(color: Colors.blue[700])),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            ForgotPassScreen(forgotPass: widget.forgotPass,)));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    color: Colors.green,
                    minWidth: 200.0,
                    height: 42.0,
                    highlightColor: Colors.grey,
                    child: Text(
                      'ĐĂNG NHẬP',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {
                      widget.appBloc.postLodgin(
                          _userNameLoginTextController.text,
                          _passwordLoginTextController.text);
                    },
                  ),
                ),
              ),
              Center(
                child: Text(
                    '-----------------Đăng nhập bằng cách khác-----------------'),
              ),
            ],
          ),
        ),
      ),
//      )
    );
  }

  Widget register() {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Container(
          height: 500.0,
          width: 300.0,
          decoration: new BoxDecoration(color: Colors.white),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Button,
                    MaterialButton(
                      height: 50.0,
                      minWidth: 100.0,
                      // animationDuration: Duration(seconds: 5),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      color: Colors.white30,
                      onPressed: (() {
                        setState(() {
                          counter = 1;
                        });
                      }),
                    ),
                    MaterialButton(
                      height: 50.0,
                      minWidth: 100.0,
                      child: Text('Đăng kí', style: TextStyle(fontSize: 25.0)),
                      color: Colors.green,
                      onPressed: (() {
                        setState(() {
                          counter = 2;
                        });
                      }),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 35.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _userNameRegisterTextController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.perm_identity),
                        hintText: 'Email',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 15.0),
                  child: TextField(
                    controller: _passwordRegisterTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock_outline),
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0, right: 10.0, top: 15.0),
                  child: TextField(
                    controller: _comfirmRegisterPasswordsTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock_outline),
                        hintText: 'Confirm Password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      color: Colors.green,
                      minWidth: 200.0,
                      height: 42.0,
                      highlightColor: Colors.grey,
                      child: Text(
                        'ĐĂNG KÍ',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        if (_comfirmRegisterPasswordsTextController.text ==
                            _passwordRegisterTextController.text)
                          widget.appBloc.postRegister(
                              _userNameRegisterTextController.text,
                              _passwordRegisterTextController.text);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return 
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(150, 7, 239, 204),
      //   title: Text('Profile'),
      // ),
       counter == 1 ? login() : register();
  
  }
}
