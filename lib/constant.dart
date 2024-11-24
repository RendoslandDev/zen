import 'package:flutter/material.dart';

const appBackgroundColor = Color(0xFF1c1c27);
const grey = Color(0xFF373741);
const buttonColor = Colors.orange;
String formateTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitHours = duration.inHours.remainder(60).toString();
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return "${twoDigitHours}h ${twoDigitMinutes}m ";
}
