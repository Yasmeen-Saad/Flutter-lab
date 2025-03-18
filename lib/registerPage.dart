import 'package:day3/loginPage.dart';
import 'package:day3/products_view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

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
              Text('User Register',  style: TextStyle(
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
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text
                      ).then((user) {
                        print(user.user!.email);
                        print(user.user!.refreshToken);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProductsScreen())
                        );
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Register',
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
                  Text("Do you have an account?"),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage())
                      );
                    },
                    child: Text(
                      'Login Now',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}