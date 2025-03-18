import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateUserScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  CreateUserScreen({super.key});

  // void createUser() {
  //   String name = nameController.text;
  //   String email = emailController.text;
  //   String password = passwordController.text;
  //
  //   print("User Created: Name: $name, Email: $email, Password: $password");
  //   // You can add Firebase/Auth logic here
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create User")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Age"),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () async{
                    final docUser = FirebaseFirestore.instance.collection("users").doc("2");
                    final userData = {
                      'name' : nameController.text,
                      'email' : emailController.text,
                      'age' : ageController.text,
                    };
                    await docUser.set(userData);
                  },
                  child: Text("Create Account"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
