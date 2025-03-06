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
      // appBar: AppBar(
      //   leading: Icon(Icons.menu),
      //   title: Text("Clicked $counter times"),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //         onPressed: (){
      //           setState(() {
      //             counter++;
      //           });
      //         },
      //         icon: Icon(Icons.ads_click)
      //     )
      //   ],
      // ),
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70,
                color: Colors.lime,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 90,
                    height: 100,
                    color: Colors.amber,
                  ),
                ],
              ),
              Container(
                width: 70,
                color: Colors.green,
              ),
            ],
          )
      ),
    );
  }
}