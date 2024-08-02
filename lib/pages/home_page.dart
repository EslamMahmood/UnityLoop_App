import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/drawer.dart';
import 'package:project/components/text_field.dart';
import 'package:project/components/unityloop_post.dart';
import 'package:project/helper/helper_method.dart';
import 'package:project/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//user
  final currentUser = FirebaseAuth.instance.currentUser!;
//text controller
  final textController = TextEditingController();
//sign out method to return the sign in page
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

//post message
  void postMessage() {
//only post if there is somthing in the textfield
    if (textController.text.isNotEmpty) {
//store in firebase
      FirebaseFirestore.instance.collection("User Posts").add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
        'Likes' :[],
      });
    }
//clear the textfield after posting
setState(() {
textController.clear();
});
  }

//navigate to profile page
void goToProfilePage(){
//pop the menu drawer
Navigator.pop(context);
//go to profile page
Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfilePage(),
));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "UnityLoop",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[500],
          ),
        ),
        backgroundColor: Colors.transparent,

      ),
      drawer:MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOutTap: signOut,

      ),
      body: Center(
          child: Column(
        children: [
          //UnityLoop
          Expanded(
            child: StreamBuilder(
                //streaming with firebase to post data
                stream: FirebaseFirestore.instance
                    .collection("User Posts")
                    .orderBy(
                      "TimeStamp",
                      descending: false,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                       //get the message from firebase
                        final post = snapshot.data!.docs[index];
                        return UnityloopPost(
                          message: post['Message'],
                          user: post['UserEmail'],
                          postId: post.id,
                          likes: List<String>.from(post['Likes'] ?? [] ),//retrieving it from firebase//if null ??
                          time: formatDate(post['TimeStamp']),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error : +${snapshot.error}',
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(), //loading circle
                  );
                }),
          ),

          //post message
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
//textfield
                Expanded(
                  child: MyTextField(
                    controller: textController,
                    hintText: 'Write something here...',
                    obscureText: false,
                  ),
                ),
//post button
                IconButton(
                  onPressed: postMessage,
                  icon: const Icon(Icons.arrow_circle_up),
                ),
              ],
            ),
          ),

          //logged in as
          Text("Logged in as : " + currentUser.email!,style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 50,),
        ],
      )),
    );
  }
}
