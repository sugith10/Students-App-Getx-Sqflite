import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/controller/db_controller/student_db_controller/student_db_controller.dart';
import 'package:student_app/model/db_student_model.dart';
import 'package:student_app/view/screen/add_screen/widget/inputfield_widget.dart';
import 'package:student_app/view/screen/add_screen/widget/submit_button_widget.dart';

class AddStudentScreen extends StatefulWidget {
  AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final TextEditingController studentName = TextEditingController();
  final TextEditingController studentClass = TextEditingController();
  final TextEditingController studentGuardian = TextEditingController();
  final TextEditingController studentMobile = TextEditingController();
  StudentDataCntrl studentDataCntrl = StudentDataCntrl();
  File? image25;
  String? imagepath;

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
                addphoto(context);
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
              addStudent(stduentName: studentName, studentClass: studentClass, studentGuardian: studentGuardian, studentMobile: studentMobile );
              print('insert function ended');
              print(studentName.text);
              print(studentGuardian);
            }),
            // Spacer()
          ],
        ),
      ),
    );
  }

  bool checkFieldsEmpty({
    required TextEditingController stduentName,
    required TextEditingController studentClass,
    required TextEditingController studentGuardian,
    required TextEditingController studentMobile,
  }) {
    if (studentName.text.isEmpty &&
        studentClass.text.isEmpty &&
        studentGuardian.text.isEmpty &&
        studentMobile.text.isEmpty) {
      return true;
    }
    imagepath ??= 'empty'; 
    return false;
  }

  addStudent({
    required TextEditingController stduentName,
    required TextEditingController studentClass,
    required TextEditingController studentGuardian,
    required TextEditingController studentMobile,
  }) async {
    bool empty = checkFieldsEmpty(
      stduentName: stduentName,
      studentClass: studentClass,
      studentGuardian: studentGuardian,
      studentMobile: studentMobile,
    );

    if (empty == true) {
      log('empty');
      return;
    }

    final name = stduentName.text.toUpperCase();
    final className = studentClass.text.toString().trim();
    final father = studentGuardian.text;
    final pNumber = studentMobile.text.trim();


    final StudentModel studentModel = StudentModel(name: name, className: className, father: father, pNumber: pNumber, imagex: imagepath!);
  
    print('come to post function');
  //  studentDataCntrl.post(studentModel);
    print('come out of end screen');


    
  }

  Future<void> getimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    setState(() {
      image25 = File(image.path);
      imagepath = image.path.toString();
    });
  }

  void addphoto(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        return AlertDialog(
          content: const Text('Choose Image From.......'),
          actions: [
            IconButton(
              onPressed: () {
                getimage(ImageSource.camera);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                getimage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.image,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }
}
