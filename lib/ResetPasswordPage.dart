import 'package:day3/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  bool isVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Reset Password',  style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              )),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value){
                  final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                  ).hasMatch(value!);
                  if(value.isEmpty){
                    return 'Please Enter Your Email';
                  }
                  else if(emailValid == false){
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
                child: MaterialButton(
                  onPressed: () async{
                    if(formKey.currentState!.validate()){
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailController.text,
                      ).then((user) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage())
                        );
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Login With New Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please Check Your Email",
                    style: TextStyle(color: Colors.deepPurple),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}