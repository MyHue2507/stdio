import 'package:flutter/material.dart';
import 'package:sample_for_team/app.dart';
import 'package:sample_for_team/app_bloc.dart';
void main(){
  AppBloc appBloc = AppBloc();
  runApp(new MyApp(appBloc: appBloc,));
} 

