import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/like_button.dart';

class UnityloopPost extends StatefulWidget {//cuz the logic of like button is different
  final String message;
  final String user;
  final String postId;
  final List<String>likes;//for counting likes

  const UnityloopPost({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
  });

  @override
  State<UnityloopPost> createState() => _UnityloopPostState();
}

class _UnityloopPostState extends State<UnityloopPost> {
//user
final currentUser = FirebaseAuth.instance.currentUser!;//! is used to label the referenced data
bool isLiked = false;

@override
  void initState() {
    super.initState();
   isLiked = widget.likes.contains(currentUser.email);//initialization for firebase for likes
  }
//toggle like
void toggleLike(){
setState(() {
isLiked = !isLiked;
});
//access the document in firebase
DocumentReference postRef = FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);
if(isLiked){
  //if the post is now liked , add the user's email to the 'Likes' field
  postRef.update({
'Likes' : FieldValue.arrayUnion([currentUser.email]),
  });
}else{
//if the post is now unliked , remove the user's email from the 'Likes' field
postRef.update({
'Likes' : FieldValue.arrayRemove([currentUser.email]),
});
}

}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,//DARK MODE
      borderRadius:BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 25 , left: 25 , right: 25 ),
      padding: EdgeInsets.all(25),
      child:Row(
      children: [
        //profile pics
         Container(
          decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.grey[400]),
          padding: EdgeInsets.all(10),
          child: const Icon(Icons.person),
         ),

         const SizedBox(width: 20,),

         //like button
         Column(
children: [
LikeButton(isLiked: isLiked, onTap: toggleLike, ),

const SizedBox(height: 1,),

//like counter
Text(widget.likes.length.toString(),style: TextStyle(color: Colors.grey),),

],
         ),
         const SizedBox(width: 20,),
        //message and useremail
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user , style: TextStyle(color: Colors.grey[500]),),
            const SizedBox(height: 10,),
            Text(widget.message),
          ],
        )
      ],
    ),);
  }
}
