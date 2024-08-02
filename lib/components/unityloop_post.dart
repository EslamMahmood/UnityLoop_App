import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/comment.dart';
import 'package:project/components/comment_button.dart';
import 'package:project/components/like_button.dart';
import 'package:project/helper/helper_method.dart';

class UnityloopPost extends StatefulWidget {
  //cuz the logic of like button is different
  final String message;
  final String user;
  final String postId;
  final String time;
  final List<String> likes; //for counting likes

  const UnityloopPost({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
    required this.time,
  });

  @override
  State<UnityloopPost> createState() => _UnityloopPostState();
}

class _UnityloopPostState extends State<UnityloopPost> {
  Future<void> editComment(String commentId, String currentCommentText) async {
  TextEditingController _commentEditingController = TextEditingController(text: currentCommentText);
  String editedComment = currentCommentText;
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        "Edit Comment",
        style: TextStyle(color: Colors.white),
      ),
      content: TextField(
        autofocus: true,
        style: TextStyle(color: Colors.white),
        controller: _commentEditingController,
        onChanged: (value) {
          editedComment = value;
        },
      ),
      actions: [
        // Cancel button
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
        // Save button
        TextButton(
          onPressed: () async {
            // Update comment in Firebase
            await FirebaseFirestore.instance
                .collection("User Posts")
                .doc(widget.postId)
                .collection("Comments")
                .doc(commentId)
                .update({"CommentText": editedComment});
            Navigator.pop(context); // Close the dialog
          },
          child: Text('Edit', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}
  void deleteComment(String commentId) {
    FirebaseFirestore.instance
        .collection("User Posts")
        .doc(widget.postId)
        .collection("Comments")
        .doc(commentId)
        .delete()
        .then((_) {
      setState(() {
        // Update the UI to remove the deleted comment
      });
    }).catchError((error) {
      print("Error deleting comment: $error");
      // Handle error
    });
  }
//user
  final currentUser = FirebaseAuth
      .instance.currentUser!; //! is used to label the referenced data
  bool isLiked = false;
  int commentCount = 0; //initialize comment count
//comment text controller
  final _commentTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    isLiked = widget.likes
        .contains(currentUser.email); //initialization for firebase for likes
    // Calculate initial comment count
    FirebaseFirestore.instance
        .collection("User Posts")
        .doc(widget.postId)
        .collection("Comments")
        .snapshots()
        .listen((snapshot) {
      setState(() {
        commentCount = snapshot.docs.length;
      });
    });
  }

//toggle like
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
//access the document in firebase
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);
    if (isLiked) {
      //if the post is now liked , add the user's email to the 'Likes' field
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email]),
      });
    } else {
//if the post is now unliked , remove the user's email from the 'Likes' field
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email]),
      });
    }
  }

//add a comment
  void addComment(String commentText) {
//write the comment to the firestore under the comments collection for this post
    FirebaseFirestore.instance
        .collection("User Posts")
        .doc(widget.postId)
        .collection("Comments")
        .add({
      "CommentText": commentText,
      "CommentedBy": currentUser.email,
      "CommentTime": Timestamp.now(), //remember to format this when displaying
    }).then((_) {
      // Increment comment count after adding a comment
      setState(() {
        commentCount++;
      });
    });
  }

//show a dialog box for adding comment
  void showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text("Add Comment",style: TextStyle(color: Colors.white)),
        content: TextField(
          autofocus: true,
          controller: _commentTextController,
          decoration: const InputDecoration(hintText: "Write a comment...",hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: [
          // Cancel button
          TextButton(
            onPressed: () {
              //pop the box
              Navigator.pop(context);
              //clear the controller
              _commentTextController.clear();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Post button
          TextButton(
            onPressed: () {
              //add the comment
              addComment(_commentTextController.text);
              //pop the box
              Navigator.pop(context);
              //clear the controller
              _commentTextController.clear();
            },
            child: const Text(
              "Post",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary, //DARK MODE
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          //profile pics
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[400]),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.person),
              ),

              const SizedBox(
                width: 20,
              ),

              //message and useremail
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //user,time
                  Row(
                    children: [
                      Text(
                        widget.user,
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Text(
                        " • ",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Text(
                        widget.time,
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.message),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          //LIKE AND COMMENT BUTTONS
          Padding(
            padding: const EdgeInsets.only(left: 62.0),
            child: Row(
              children: [
                Column(
                  children: [
                    //like button
                    LikeButton(
                      isLiked: isLiked,
                      onTap: toggleLike,
                    ),

                    const SizedBox(
                      height: 1,
                    ),

                    //like counter
                    Text(
                      widget.likes.length.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                //comment button
                Column(
                  children: [
                    CommentButton(onTap: showCommentDialog),

                    const SizedBox(
                      height: 1,
                    ),

                    //comment counter
                    Text(
                      commentCount.toString(),//displaying comment count
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //comments under the post
          StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance
      .collection("User Posts")
      .doc(widget.postId)
      .collection("Comments")
      .orderBy("CommentTime", descending: true)
      .snapshots(),
  builder: (context, snapshot) {
    // Show loading circle if no data yet
    if (!snapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        final commentData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
        final commentId = snapshot.data!.docs[index].id; // Get the comment ID here
        return Comment(
          text: commentData["CommentText"],
          user: commentData["CommentedBy"],
          time: formatDate(commentData["CommentTime"]),
          onDelete: () => deleteComment(commentId), // Pass commentId to the delete function
          onEdit: () => editComment(commentId, commentData["CommentText"]),
        );
      },
    );
  },
),

        ],
      ),
    );
  }
}
