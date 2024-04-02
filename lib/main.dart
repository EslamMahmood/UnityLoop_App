import 'package:flutter/material.dart';
import 'package:project/auth/auth.dart';
//import 'package:project/auth/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/theme/dark_theme.dart';
import 'package:project/theme/light_theme.dart';
import'firebase_options.dart';

void main() async{//for initializing the firebase
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,

      home: const AuthPage(),
    );
  }
}


