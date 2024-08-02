import 'package:flutter/material.dart';
import 'package:project/theme/dark_theme.dart';
import 'package:project/theme/light_theme.dart';

class ThemeProvider with ChangeNotifier{
  //initial light mode
  ThemeData _themeData = lightTheme;
  //getter method to access the theme from other parts of the code
  ThemeData get themeData =>_themeData;
  //getter method to check if we are in the dark mode or not 
  bool get isDarkMode => _themeData == darkTheme;
  //setter method to set the new theme
  set themeData (ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  //we will use this toggle in switch later on...
  void toggleTheme(){
    if(_themeData == lightTheme){
      themeData = darkTheme;
    }
    else{
      themeData = lightTheme;
    }
  }
}