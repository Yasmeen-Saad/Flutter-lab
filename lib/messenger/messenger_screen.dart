import 'package:day3/messenger/message_widget.dart';
import 'package:day3/messenger/story_widget.dart';
import 'package:flutter/material.dart';

class Users{
  String name;
  String message;
  String time;
  String image;
  bool isOnline;
  Users({
    required this.name,
    required this.message,
    required this.time,
    required this.image,
    required this.isOnline
  });
}

class MessengerScreen extends StatelessWidget {
  MessengerScreen({super.key});

  List<Users> users = [
    Users(
      name: "Yasmeen Saad",
      message: "Hey, how are you doing?",
      time: "10:25 AM",
      image: "assets/images/pic6.png",
      isOnline: true
    ),
    Users(
        name: "Abdelrahman",
        message: "Just finished my project, feeling great!",
        time: "9:12 AM",
        image:"assets/images/pic2.png",
        isOnline: true
    ),
    Users(
        name: "Farah Ahmed",
        message: "Hey, how are you doing?",
        time: "11:05 PM",
        image: "assets/images/pic3.png",
        isOnline: false
    ),
    Users(
        name: "Hana Ali",
        message: "Let’s catch up later this week.",
        time: "8:15 PM",
        image: "assets/images/pic4.png",
        isOnline: false
    ),
    Users(
        name: "Selim",
        message: "I’m planning a trip to Alexandria next week.",
        time: "3:10 PM",
        image: "assets/images/pic1.png",
        isOnline: true
    ),
    Users(
        name: "Aya Abdelaziz",
        message: "Just finished watching a Netflix series, it was so good!",
        time: "Yesterday",
        image: "assets/images/pic7.png",
        isOnline: false
    ),
    Users(
        name: "Salma Youssef",
        message: "Let's go for a run tomorrow morning.",
        time: "2 days ago",
        image: "assets/images/pic5.png",
        isOnline: true
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredUsers = users.where((user) => user.isOnline).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Chats', style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.camera_alt, color: Colors.white,),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.settings, color: Colors.white,)
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 5),
                    Text('Search')
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => StoryWidget(
                    user: filteredUsers[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: filteredUsers.length,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => MessageWidget(
                  user: users[index],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: users.length,
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
