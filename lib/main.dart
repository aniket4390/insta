import 'package:flutter/material.dart';
import 'package:instagram/screens/explore.dart';
import 'package:instagram/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
      home: const Explore(),
    );
  }
}

