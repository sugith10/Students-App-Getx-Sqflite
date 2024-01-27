import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/controller/db_controller/student_db_controller/data_list.dart';
import 'package:student_app/controller/db_controller/student_db_controller/student_db_controller.dart';
import 'package:student_app/model/db_student_model.dart';
import 'package:student_app/view/screen/add_screen/widget/inputfield_widget.dart';
import 'package:student_app/view/screen/add_screen/widget/submit_button_widget.dart';

class AddStudentScreen extends StatelessWidget {
  final bool isEdit;
  final StudentModel? studentModel;

  AddStudentScreen({
    this.isEdit = false,
    this.studentModel,
    super.key,
  }){
     if (isEdit && studentModel != null) {
      studentName.text = studentModel!.name;
      studentClass.text = studentModel!.className;
      studentGuardian.text = studentModel!.father;
      studentMobile.text = studentModel!.pNumber;
    }
  }

  final TextEditingController studentName = TextEditingController();

  final TextEditingController studentClass = TextEditingController();

  final TextEditingController studentGuardian = TextEditingController();

  final TextEditingController studentMobile = TextEditingController();

  // final StudentDataCntrl studentDataCntrl = StudentDataCntrl();

  File? image25;

  String? imagepath;

  final StudentDataList studentDataListController = Get.find<StudentDataList>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // addphoto(context);
              },
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
                child: image25 == null
                    ? const Icon(
                        Icons.person,
                        size: 50,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.file(
                          image25!,
                          fit: BoxFit.cover,
                        )),
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
                textController: studentMobile,
                hintText: 'Mobile No',
                textInputType: TextInputType.number),
            const SizedBox(
              height: 40,
            ),
            // Spacer(),
            SubmitButton(onTap: () {
              print('insert function started');

              String photo = 'nothing';

              studentDataListController.addData(
                  studentName.text,
                  studentClass.text,
                  studentGuardian.text,
                  studentMobile.text,
                  photo);
              print('insert function ended');
            }),
            // Spacer()
          ],
        ),
      ),
    );
  }
}
