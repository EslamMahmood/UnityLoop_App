import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/components/button.dart';
import 'package:project/components/text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
final emailTextController = TextEditingController();

 @override
 void dispose(){
emailTextController.dispose();
super.dispose();
 }

Future passwordReset () async{
  try{
await FirebaseAuth.instance.sendPasswordResetEmail(email: emailTextController.text.trim());
showDialog(context: context, builder: (context){
return AlertDialog(
   content: Text('Password reset link sent! Check your email'),);
});
}
on FirebaseAuthException catch(e){
  print(e);//run on the console when fake user
//to make a feedback to fake user in the page
showDialog(context: context, builder: (context){
return AlertDialog(
  content: Text(e.message.toString()),
);
});
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
appBar: AppBar(
  title: Text('Check out your Email',style: TextStyle(color: Colors.white),),
backgroundColor: Colors.grey[500],
elevation: 0,
),

      body: Padding(padding:const EdgeInsets.all(20.0),
      child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.abc_sharp,size: 150,),
          const SizedBox(height: 10.0,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Enter your valid email",style: TextStyle(color: Colors.grey,fontSize:20.0,fontWeight: FontWeight.bold),),
          ),
          const Text("you will recieve a reset password link from firebase",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
          const SizedBox(height: 25.0,),
        
        
          MyTextField(
  controller: emailTextController, hintText: 'Email', obscureText: false,),
  const SizedBox(height: 25.0,),
  MyButton(//for resetpassword button
    onTap: passwordReset,text:'Reset Password',),
      ],),),
    );
  }
}