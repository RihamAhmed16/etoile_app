import 'package:cloud_firestore/cloud_firestore.dart';

String formatTime({required Timestamp timestamp }) {
  DateTime dateTime = timestamp.toDate();
  String formattedDate = "${dateTime.day.toString().padLeft(2, '0')}/"
      "${dateTime.month.toString().padLeft(2, '0')}/"
      "${dateTime.year}";
  return formattedDate;
}
