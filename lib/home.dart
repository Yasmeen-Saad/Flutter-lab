import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("You clicked $counter times"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  counter++;
                });
              },
              icon: Icon(Icons.ads_click)
          )
        ],
      ),
    );
  }
}

