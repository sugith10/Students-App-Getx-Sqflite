import 'package:flutter/material.dart';
import 'package:student_app/controller/screen_controller/navigation_controller/screen_transitions/left_to_right.dart';
import 'package:student_app/view/add_screen/add_screen.dart';

class AddScreenNavigation{
   _toAddScreenLeftToRight(BuildContext context){
    Navigator.of(context).push(rightToLeft(AddStudentScreen()));
  }
   toAddScreenLeftToRight(BuildContext context){
    _toAddScreenLeftToRight(context);
  }
}