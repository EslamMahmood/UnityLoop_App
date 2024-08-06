import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../components/text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  TextEditingController _postController = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('Users');
  final postsCollection = FirebaseFirestore.instance.collection('Posts');

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit " + field,
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () async {
              if (newValue.trim().length > 0) {
                await usersCollection
                    .doc(currentUser.email)
                    .update({field: newValue});
                Navigator.pop(context);
              }
            },
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _post() async {
    if (_postController.text.isNotEmpty || _image != null) {
      final imageURL = await uploadImageToFirebase();
      await postsCollection.add({
        'text': _postController.text,
        'imageURL': imageURL,
        'userId': currentUser.uid,
        'timestamp': DateTime.now(),
      });
      setState(() {
        _postController.clear();
        _image = null;
      });
    }
  }

  Future<String?> uploadImageToFirebase() async {
    if (_image != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('posts_images')
          .child('${DateTime.now()}.jpg');
      await ref.putFile(_image!);
      return ref.getDownloadURL();
    }
    return null;
  }

  Future<void> deletePost(String postId) async {
    // Delete post document from Firestore
    await postsCollection.doc(postId).delete();

    // If the post has an associated image, delete it from Firebase Storage
    final post = await postsCollection.doc(postId).get();
    if (post.exists) {
      final imageURL = post['imageURL'];
      if (imageURL != null) {
        await FirebaseStorage.instance.refFromURL(imageURL).delete();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Profile Page',
          style: TextStyle(color: Colors.grey[500]),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.person,
                  size: 72,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  currentUser.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(padding: EdgeInsets.all(25.0),child: Divider(),),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20,),
                MyTextBox(
                  text: userData['username'],
                  sectionName: 'username',
                  onPressed: () => editField('username'),
                ),
                MyTextBox(
                  text: userData['bio'],
                  sectionName: 'bio',
                  onPressed: () => editField('bio'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.all(25.0),child: Divider(),),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Posts',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _image != null
                        ? Image.file(_image!, width: 100, height: 100)
                        : SizedBox(),
                    //post message
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
//textfield
                Expanded(
                  child: MyTextField(
                    controller: _postController,
                    hintText: 'Write something here...',
                    obscureText: false,
                  ),
                ),
//post button
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: _getImage,
                          icon: Icon(Icons.add_a_photo_outlined),
                          color: Colors.grey,
                        ),IconButton(
                  onPressed: _post,
                  icon: const Icon(Icons.arrow_circle_down),
                ),
              ],
            ),
              ],
            ),
          ),
                  
                    SizedBox(height: 20),
                    StreamBuilder<QuerySnapshot>(
                      stream: postsCollection
                          .where('userId', isEqualTo: currentUser.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final posts = snapshot.data!.docs;
                          return Column(
                            children: posts.map((post) {
                              final postText = post['text'];
                              final imageURL = post['imageURL'];
                              final postId = post.id; // Document ID

                              return Column(
                                children: [
                                  if (postText != null)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(postText),
                                    ),
                                  if (imageURL != null)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        imageURL,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  IconButton(
                                    onPressed: () => deletePost(postId),
                                    icon: Icon(Icons.delete),
                                    color: Colors.grey,
                                  ),
                                ],
                              );
                            }).toList(),
                         
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final Function onPressed;

  const MyTextBox({
    required this.text,
    required this.sectionName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(color: Colors.grey[700]),
      ),
      trailing: IconButton(
        onPressed: () => onPressed(),
        icon: Icon(Icons.edit),
        color: Colors.grey,
      ),
    );
  }
}
