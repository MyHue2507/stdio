import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_for_team/app_bloc.dart';
import 'package:sample_for_team/app_state.dart';
import 'package:sample_for_team/home/home.dart';
import 'package:sample_for_team/sign_in/sign_in.dart';
import 'package:sample_for_team/splash/splash.dart';

class MyApp extends StatefulWidget {
  final AppBloc appBloc;

  const MyApp({Key key, this.appBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

class _MyState extends State<MyApp> {
  bool _isLogged = false;
  StreamSubscription<AppState> userSubcription;
  @override
  void initState() {
    super.initState();
    userSubcription = widget.appBloc.appState
    .listen((s) {
        if (s.isLogged != _isLogged){
          setState(() => _isLogged = s.isLogged);
        }
    });
  }

  @override
  void dispose() {
    userSubcription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.red,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        "/": (_) => _isLogged ? HomeScreen() : SignInScreen(appBloc: widget.appBloc,),
      },
    );
  }
}
