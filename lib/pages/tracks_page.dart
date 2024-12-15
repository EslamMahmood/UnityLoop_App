import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/IS_page.dart';
import 'package:project/pages/IT_page.dart';
import 'package:project/pages/cs_page.dart';
import '../components/button.dart';

class TracksPage extends StatefulWidget {
  const TracksPage({super.key});

  @override
  State<TracksPage> createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  // Define the navigation function
  void CS() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CSPage(),
      ),
    );
  }

  void IT() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ITPage(),
      ),
    );
  }

  void IS() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ISPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tracks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.verified_user,
              color: Colors.teal,
              size: 130,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Select your department',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            MyButton(
              onTap: CS, // Pass the navigation function
              text: 'Computer Science (CS)', // Set the button label
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              onTap: IT, // Pass the navigation function
              text: 'Information Technology (IT)', // Set the button label
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              onTap: IS, // Pass the navigation function
              text: 'Information Systems (IS)', // Set the button label
            ),
          ],
        ),
      ),
    );
  }
}
