import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:project/auth/login_or_register.dart';
import 'package:project/pages/home_page.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});


  @override
  Widget build(BuildContext context) {//for firebase auth
    return Scaffold(
body:StreamBuilder(
stream: FirebaseAuth.instance.authStateChanges(),//that line makes the action of transfering into the home page
  builder: (context , snapshot){
//user logged in
if(snapshot.hasData){
  return const HomePage();
}
//useris not logged in
else{
return const LoginOrRegister();
}

},)
    );
  }
}