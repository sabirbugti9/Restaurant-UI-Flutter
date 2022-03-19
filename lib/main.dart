import 'package:flutter/material.dart';

import 'screens/custom_bar/custom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Kit',
      home: CustomBar(),
    );
  }
}
