import 'package:flutter/material.dart';
import 'package:primerappflutter/src/screens/MyHomePage.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: MyHomePage(title: 'My App Luis'),
    );
  }
}