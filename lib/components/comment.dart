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
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
        children: [
          // Left section: User and comment
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User and time row
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    const SizedBox(width: 5),
                    Row(children: [
                      Text(
                        "date: ",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        time,
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ]),
                  ],
                ),
                const SizedBox(height: 10),

                // Comment text with scrolling
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 100, // Adjust maxHeight as needed
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Right section: 3-dot menu for Delete & Edit
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.grey[400]),
            onSelected: (String value) {
              if (value == 'delete') {
                onDelete();
              } else if (value == 'edit') {
                onEdit();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(CupertinoIcons.delete_solid, color: Colors.red),
                    const SizedBox(width: 8),
                    Text('Delete'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'edit',
                child: Row(
                  children: [
                    Icon(Icons.settings_outlined, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text('Edit'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
