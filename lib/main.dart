import 'package:flutter/material.dart';
import 'package:project/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/theme/theme_provider.dart';
import'firebase_options.dart';
import 'package:provider/provider.dart';


void main() async{//for initializing the firebase
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>ThemeProvider()),
 ],
 child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      

      home: const AuthPage(),
     theme : Provider.of<ThemeProvider>(context).themeData,

    );
  }
}


