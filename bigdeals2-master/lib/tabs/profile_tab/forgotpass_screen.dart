import 'package:flutter/material.dart';
import 'package:bigdeals2/tabs/tabs.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  ForgotPass forgotPass = ForgotPass();

  ForgotPassScreen({Key key, this.forgotPass}) : super(key: key);

  ForgotPassScreenState createState() {
    return ForgotPassScreenState();
  }
}

class ForgotPassScreenState extends State<ForgotPassScreen> {
  TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new Container(
          color: Colors.grey,
          child: new Center(
//              child: new ClipRect(
//                child: new BackdropFilter(
            child: new Container(
              height: 250.0,
              width: 350.0,
              decoration: new BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                    child: Text(
                      'Mật khẩu mới sẽ được gửi đến email của bạn',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 30.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextController,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.perm_identity),
                          hintText: 'Nhập email tại đây',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      child: MaterialButton(
                        color: Colors.green,
                        minWidth: 200.0,
                        height: 42.0,
                        highlightColor: Colors.grey,
                        child: Text(
                          'SEND',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () {
                          widget.forgotPass
                              .postForgotPassword(_emailTextController.text)
                              .then((onValue) {
                            showDialog(
                                context: context,
                                child: AddItemDialog(message: onValue));
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
//              ),
        ),
//          ),
      ),
    );
  }
}
