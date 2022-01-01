import 'package:bigo_task/globals.dart';
import 'package:flutter/material.dart';
import 'package:bigo_task/screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BigO Task',
      theme: ThemeData.light().copyWith(primaryColor: globals.appMainColor),
      home: Dashboard(),
    );
  }
}
