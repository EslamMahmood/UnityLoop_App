import"package:flutter/material.dart";
import "package:project/components/my_list_tile.dart";
import "package:project/pages/settings_page.dart";
class MyDrawer extends StatelessWidget {
  final void Function()?onProfileTap;
  final void Function()?onSignOutTap;
  const MyDrawer({super.key,required this.onProfileTap, required this.onSignOutTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      children: [
        //header
DrawerHeader(child: Icon(Icons.person,color: Colors.white,size:64)),

//home list title
MyListTile(icon: Icons.home, text: 'H O M E', onTap:()=>Navigator.pop(context),),
//profile list title
MyListTile(icon: Icons.person, text: 'P R O F I L E', onTap: onProfileTap),
//settings
MyListTile(icon: Icons.settings, text: 'S E T T I N G S', onTap:(){Navigator.pop(context);
Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));}),
   ] ),

//logout list title
Padding(padding: const EdgeInsets.only(bottom: 25.0),
child: MyListTile(icon: Icons.logout, text: 'L O G O U T', onTap: onSignOutTap),
),],
),
    );
  }
}