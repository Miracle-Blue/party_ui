import 'package:flutter/material.dart';
import 'package:party_ui/pages/home_page.dart';
import 'package:party_ui/pages/pin_code_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PinCodePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
