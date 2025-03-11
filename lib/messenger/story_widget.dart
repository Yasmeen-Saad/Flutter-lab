import 'package:flutter/material.dart';
import 'package:day3/messenger/messenger_screen.dart';

class StoryWidget extends StatelessWidget {
  StoryWidget({super.key, required this.user});

  Users user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
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
            height: 3,
          ),
          Text(
            user.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
