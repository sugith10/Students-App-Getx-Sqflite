import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/model/db_student_model.dart';
import 'package:student_app/view/screen/add_screen/add_screen.dart';
import 'package:student_app/view/screen/view_student_screen/widget/details_text_widget.dart';

class ViewStudentDataScrn extends StatelessWidget {
  final StudentModel studentModel;
  const ViewStudentDataScrn({required this.studentModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'asset/img/hero.png',
                    height: 220,
                    width: 220,
                  )),
              const SizedBox(
                height: 50,
              ),
               DetailsTextWidget(head: 'Student Name' , body: studentModel.name,),
              const SizedBox(
                height: 20,
              ),
                DetailsTextWidget(head: 'Student Class', body: studentModel.className,),
                  const SizedBox(
                height: 20,
              ),
               DetailsTextWidget(head: 'Parent Name', body: studentModel.father,),
                const SizedBox(
                height: 20,
              ),
               DetailsTextWidget(head: 'Student Mobile No', body: studentModel.pNumber,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 47, 47, 50),
        onPressed: () {
          Get.to(AddStudentScreen(isEdit: true,studentModel: studentModel,));
        },
        child: const Icon(
          Icons.edit_document,
          color: Colors.white,
        ),
      ),
    );
  }
}

