import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lives',
      theme: ThemeData(
        primarySwatch: Colors.red,
        buttonColor: Colors.red,
        indicatorColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
