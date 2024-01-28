import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_app/controller/db_controller/db_controller.dart';
import 'package:student_app/model/db_student_model.dart';

class StudentListModel extends GetxController {
  RxList<StudentModel> studentModelList = <StudentModel>[].obs;
}

class StudentDataCntrl extends DataBaseController {
  late Database _db;
  final StudentListModel studentListModel = StudentListModel();

  StudentDataCntrl() {
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    await openDB();
  }

  @override
  Future<void> openDB() async {
    // TODO: implement openDB
    _db = await openDatabase(
      'student_db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE student(id INTEGER PRIMARY KEY, name TEXT,classname TEXT, father TEXT, pnumber TEXT, imagex TEXT)');
      },
    );
    debugPrint('Database created successfully.');
    log('Database created successfully.');
  }

  @override
  Future<void> post(covariant StudentModel data) async {
    // TODO: implement post

    try {
      await _db.rawInsert(
          'INSERT INTO student(name,classname,father,pnumber,imagex) VALUES(?,?,?,?,?)',
          [data.name, data.className, data.father, data.pNumber, data.imagex]);

      await get();
    } catch (e) {
      log('Error inserting data: $e');
    }
  }

  @override
  Future<void> get() async {
    // TODO: implement get
    final result = await _db.rawQuery("SELECT * FROM student");
    log('All Students data : $result');

    // for (var map in result) {
    //   final student = StudentModel.fromMap(map);
    //   _studentListModel.studentModelList.add(student);
    // }
    studentListModel.studentModelList
        .assignAll(result.map((map) => StudentModel.fromMap(map)).toList());
  }

  Future<void> editStudent(
    int id,
    String studentName,
    String studentClass,
    String studentFather,
    String studentPhoneNo,
    String studntPhoto,
  ) async {
    final updateData = {
      'name': studentName,
      'classname': studentClass,
      'father': studentFather,
      'pnumber': studentPhoneNo,
      'imagex': studntPhoto,
    };

    await put(id, updateData);
  }

  @override
  Future<void> put(int id, Map<String, dynamic> updateData) async {
    // TODO: implement put
    await _db.update('student', updateData, where: 'id=?', whereArgs: [id]);
  }

  @override
  Future<void> delete(String id) async {
    // TODO: implement delete
    await _db.delete('student', where: 'id=?', whereArgs: [id]);
  }
}
