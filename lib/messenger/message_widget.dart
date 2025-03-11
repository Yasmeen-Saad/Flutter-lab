import 'package:flutter/material.dart';
import 'package:day3/messenger/messenger_screen.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({super.key, required this.user});

  Users user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(user.image),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.green,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      user.message,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                  Text(user.time, style: TextStyle(
                      fontSize: 13
                  ),),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
