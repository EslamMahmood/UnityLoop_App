import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const Comment({
    super.key,
    required this.text,
    required this.user,
    required this.time,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //user,time
              Row(
                children: [
                  Text(
                    user,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  Text(
                    " • ",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //comment(text)
              Text(text),
            ],
          ),
          
         Padding(
          padding: EdgeInsets.only(left: screenWidth*0.05), // Adjust the multiplier as needed
          child: IconButton(
            icon: Icon(CupertinoIcons.delete_solid, color: Colors.grey[400]),
            onPressed: onDelete,
          ),
        ),
        IconButton(
          onPressed: onEdit,
          icon: Icon(Icons.settings_outlined, color: Colors.grey[400]),
        ),
        ],
      ),
    );
  }
}
