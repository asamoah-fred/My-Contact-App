import 'package:awesome_contact_app/home_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.blue),
              titleTextStyle: TextStyle(color: Colors.blue, fontSize: 18),
              elevation: 0.5)),
      debugShowCheckedModeBanner: false,
      home: Homeview(),
    );
  }
}
