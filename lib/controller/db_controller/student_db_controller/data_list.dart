import 'package:student_app/model/db_student_model.dart';

List<StudentModel> studentModelList = [];

class StudentDataList {
  
 void addData(
    String studentName,
    String studentClass,
    String studentFather,
    String studentPhoneNo,
    String studntPhoto,
  ) {
    final studentModel = StudentModel(
      name: studentName,
      className: studentClass,
      father: studentFather,
      pNumber: studentPhoneNo,
      imagex: studntPhoto,
    );
   studentModelList.add(studentModel);
   print(studentModelList.length);
  }
}



