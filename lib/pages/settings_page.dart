import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Theme Mode',style:TextStyle(color: Colors.grey[500]),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: 
      Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
        ),
        padding:const EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
        margin:const EdgeInsets.only(left: 25.0,right: 25.0,top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          //dark mode
          Text('Dark Mode',style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.grey[500]),),
          //switch toggle
          CupertinoSwitch(value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode,
           onChanged: (value)=>Provider.of<ThemeProvider>(context,listen: false).toggleTheme()),
        ],),
      ),
    );
  }
}