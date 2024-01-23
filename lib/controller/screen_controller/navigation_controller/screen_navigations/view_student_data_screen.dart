import 'package:flutter/material.dart';
import 'package:student_app/controller/screen_controller/navigation_controller/screen_transitions/left_to_right.dart';
import 'package:student_app/screens/view_student_screen/view_student_scrn.dart';

class ViewStudentDataScrnNav{
   void _toViewStudentDataLeftToRight(BuildContext context){
    Navigator.of(context).push(rightToLeft(ViewStudentDataScrn()));
  }
  void toViewStudentDataLeftToRight(BuildContext context){
    _toViewStudentDataLeftToRight(context);
  }
}