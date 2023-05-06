import 'package:flutter/material.dart';
import 'package:womam_shop/constants.dart';
import 'package:womam_shop/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Womem Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: kTextColor
        )
      ),
      home: Home()
    );
  }
}
