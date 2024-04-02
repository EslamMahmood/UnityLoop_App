import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
  content: Text('Password reset link sent! Check your email'),
);
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
appBar: AppBar(
  title: Text('Check out your Email',style: TextStyle(color: Colors.white),),
backgroundColor: Colors.grey[500],
elevation: 0,
),



      body: Column(
     mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Enter your email and we will send you a password reset link'),
        const SizedBox(height: 15.0,),
          MyTextField(
  controller: emailTextController, hintText: 'Email', obscureText: false,),
  const SizedBox(height: 15.0,),
  MaterialButton(//for resetpassword button
    onPressed: passwordReset,
child: Text('Reset Password',style: TextStyle(color: Colors.white),),
color: Colors.grey[600],
    ),
      ],),
    );
  }
}