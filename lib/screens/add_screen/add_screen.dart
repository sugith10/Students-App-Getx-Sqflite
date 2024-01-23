import 'package:flutter/material.dart';
import 'package:student_app/screens/add_screen/widget/inputfield_widget.dart';
import 'package:student_app/screens/add_screen/widget/submit_button_widget.dart';

class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({super.key});
  final TextEditingController studentName = TextEditingController();
  final TextEditingController studentClass = TextEditingController();
  final TextEditingController studentGuardian = TextEditingController();
  final TextEditingController studentMobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            StudentInputField(
                textController: studentName, hintText: 'Student Name'),
            const SizedBox(
              height: 20,
            ),
            StudentInputField(textController: studentClass, hintText: 'Class'),
            const SizedBox(
              height: 20,
            ),
            StudentInputField(
                textController: studentGuardian, hintText: 'Guardian'),
            const SizedBox(
              height: 20,
            ),
            StudentInputField(
                textController: studentMobile, hintText: 'Mobile No'),
            const SizedBox(
              height: 40,
            ),
            // Spacer(),
            SubmitButton(onTap: () {
              print(studentName.text);
              print(studentGuardian);
            }),
            // Spacer()
          ],
        ),
      ),
    );
  }
}

