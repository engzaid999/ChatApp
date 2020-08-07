import 'package:flutter/material.dart';
import 'package:messengermobile/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger App',
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Color(0xFFFEF9EB),
      ),
      home: HomePage(),
    );
  }
}
