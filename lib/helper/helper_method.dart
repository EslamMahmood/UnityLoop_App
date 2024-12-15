//return a formatted date as a string 
import 'package:cloud_firestore/cloud_firestore.dart';

String formatDate(Timestamp timestamp){
//Timestamp is the object we retrieve from firebase
// so to display it, let's convert it to a string
DateTime dataTime = timestamp.toDate();
//get year 
String year = dataTime.year.toString();
//get month 
String month = dataTime.month.toString();
//get day
String day = dataTime.day.toString();
//final formatted date
String formattedDate = '$day/$month/$year';

return formattedDate;
}