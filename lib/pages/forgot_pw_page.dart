import 'package:firebase_auth/firebase_auth.dart';
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
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    // Show a dialog to inform the user that the password reset email is being sent
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents closing the dialog by tapping outside
      builder: (context) {
        return AlertDialog(
          title: Text('Password Reset'),
          content:
              Text('You will receive a reset password link from Firebase.'),
        );
      },
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextController.text.trim());

      // Wait for  seconds before closing the dialog
      Future.delayed(Duration(seconds: 1), () {
        //close the window
        Navigator.pop(context);
      });

      // Show a confirmation message using ScaffoldMessenger
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset link sent! Check your email.'),
          duration: Duration(seconds: 5),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Close the initial dialog
      Navigator.pop(context);

      // Show an error message using ScaffoldMessenger
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Check out your Email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.abc_sharp,
              size: 150,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Enter your valid email",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: emailTextController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(
              height: 25.0,
            ),
            MyButton(
              // for reset password button
              onTap: passwordReset,
              text: 'Reset Password',
            ),
          ],
        ),
      ),
    );
  }
}
