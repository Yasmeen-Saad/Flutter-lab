import 'package:day3/products_view/home.dart';
import 'package:flutter/material.dart';
import 'package:day3/home.dart';
import 'package:day3/loginPage.dart';
import 'package:day3/messenger/messenger_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: false,
      ),
      home: ProductsScreen(),
    );
  }
}
