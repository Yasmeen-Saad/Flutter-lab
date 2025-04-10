import 'package:day3/ResetPasswordPage.dart';
import 'package:day3/dio/api_provider.dart';
import 'package:day3/products_view/home.dart';
import 'package:day3/registerPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
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
              Text('User Login',  style: TextStyle(
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
                  // else if(emailValid == false){
                  //   return 'Please Enter Valid Email';
                  // }
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
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please Enter Your Password';
                  }
                  return null;
                },
                controller: passwordController,
                obscureText: isVisible,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off)
                    )
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
                      // print(emailController.text);
                      // print(passwordController.text);
                      // await ApiProvider().userLoginEmail(
                      //     email: emailController.text,
                      //     password: passwordController.text
                      // ).then((value) {
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Success')));
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => ProductsScreen())
                      //   );
                      // }).catchError((error) {
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                      // });
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text
                      ).then((user) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Success')));
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProductsScreen())
                        );
                      }).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                     });
                    }
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    String tokenFromSharedPreferences =  prefs.getString('token')!;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage())
                        );
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forget your password?"),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResetPasswordPage())
                      );
                    },
                    child: Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
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
