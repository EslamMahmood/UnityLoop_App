import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/text_field.dart';
import 'package:project/components/button.dart';
class RegisterPage extends StatefulWidget {
final Function() ? onTap;
  const RegisterPage({super.key , required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();


//sign Up method(onAction)
void signUp() async{
//show loading circle
showDialog(context: context, builder:(context) =>const Center(child: CircularProgressIndicator(),));

//make sure passwords match
if(passwordTextController.text != confirmPasswordTextController.text){

//pop loading circle
Navigator.pop(context);
//show error to the user
displayMessage("Passwords don't match, try again");
return;}

try{
//Making collection of users(create the user)
 UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);

//after creating the user, create a new document in cloud firebase called Users
FirebaseFirestore.instance
.collection('Users')
.doc(userCredential.user!.email)
.set({'username' : emailTextController.text.split('@')[0],//initial username
      'bio' :'Empty bio..' //initially empty bio
      //add any additional fields as needed
          });

//pop loading circle
if(context.mounted) Navigator.pop(context);

} on FirebaseAuthException catch(e){
//pop loading circle
Navigator.pop(context);
//display error message
displayMessage(e.code);
}


}

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
                  Icons.lock,
                  size: 100,
                ),

//welcome back message
                const SizedBox(height: 30),
                const Text("Let's create an account for you",style: TextStyle(color: Colors.grey),),

                const SizedBox(
                  height: 25,
                ),

//email textfield
MyTextField(
  controller: emailTextController, hintText: 'Email', obscureText: false,),
  const SizedBox(height: 10,),

  //password textfield
const SizedBox(height: 10,),

MyTextField(
  controller: passwordTextController, hintText: 'Password', obscureText: true,),

const SizedBox(height: 25,),

//confirm password textfield
MyTextField(
  controller: confirmPasswordTextController, hintText: 'Confirm Password', obscureText: true,),

//sign up button
const SizedBox(height: 25,),
MyButton(onTap: signUp, text: 'Sign Up'),
const SizedBox(height: 25,),


//go to register page
Row(
mainAxisAlignment: MainAxisAlignment.center,
  children: [

Text("Already have an account?",style: TextStyle(color: Colors.grey[700]),),
const SizedBox(width: 4,),
GestureDetector(
onTap: widget.onTap,
child:
const Text("Login now",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue),),
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