import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/button.dart';
import 'package:project/pages/forgot_pw_page.dart';
import 'package:project/components/text_field.dart';


class LoginPage extends StatefulWidget {
  final Function() ? onTap;
  const LoginPage({super.key , required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

//sign in method (onAction)
void signIn() async{

//show loading circle
showDialog(context: context, builder:(context) =>const Center(child: CircularProgressIndicator(),));

  try{//if any errors while sign in
await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailTextController.text, password: passwordTextController.text);

//pop loading circle
if(context.mounted) Navigator.pop(context);

  }
  on FirebaseAuthException catch(e){
//pop loading circle
Navigator.pop(context);
//display error message
displayMessage(e.code);

  }
}

//display a dialog message while errors
void displayMessage(String message){
showDialog(context: context, builder:((context) => AlertDialog(
title: Text(message),
)),
);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                const Icon(
                  Icons.person,
                  size: 150,
                ),

//welcome back message
                const SizedBox(height: 10),
                const Text("Welcome back, you've been missed!",style: TextStyle(color: Colors.grey),),

                const SizedBox(
                  height: 25,
                ),
//email textfield
MyTextField(
  controller: emailTextController, hintText: 'Email', obscureText: false,),
  //password textfield
const SizedBox(height: 25,),
                MyTextField(
  controller: passwordTextController, hintText: 'Password', obscureText: true,),

//forgot password field
const SizedBox(height: 10,),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [ GestureDetector(//to be tabble
onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return ForgotPasswordPage();
}),);

},
    child:Text('Forgot Password?',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue),),
            ),]),

//sign in button
const SizedBox(height: 25,),
MyButton(onTap: signIn, text: 'Sign In'),
const SizedBox(height: 20,),
//go to register page
Row(
mainAxisAlignment: MainAxisAlignment.center,
  children: [

Text("Not a member?",style: TextStyle(color: Colors.grey[700]),),
const SizedBox(width: 4,),
GestureDetector(
onTap: widget.onTap,
child:
const Text("Register now",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue),),
),],
),
              ],
            ),
          ),
        ),
      ),
    );
  }
}