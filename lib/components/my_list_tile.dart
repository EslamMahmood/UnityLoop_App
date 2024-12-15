import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class MyListTile extends StatelessWidget {//we made this class to not repeat the code in drawer list tiles
final IconData icon;
final String text;
final void Function()? onTap;
  const MyListTile({super.key,required this.icon,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(left: 8.0),
     child: ListTile(
      leading: Icon(icon,color: Colors.white,),
      title:Text(text,style: TextStyle(color: Colors.white),),
onTap: onTap ,
    ),);
  }
}