import 'package:cal/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyMain());
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Myhome(), debugShowCheckedModeBanner: false);
  }
}
