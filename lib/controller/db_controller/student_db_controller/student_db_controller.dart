import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_app/model/db_student_model.dart';

class StudentDataCntrl extends GetxController {
  late Database? _db;
  RxList<StudentModel> studentModelList = <StudentModel>[].obs;
  bool isDbInitialized = false;

  StudentDataCntrl() {
    initializeDatabase();
    update();
  }

  Future<void> initializeDatabase() async {
    if (!isDbInitialized) {
      await openDB();
      isDbInitialized = true;
    }
  }

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

  Future<void> post(covariant StudentModel data) async {
    // TODO: implement post

    try {
      await _db!.rawInsert(
          'INSERT INTO student(name,classname,father,pnumber,imagex) VALUES(?,?,?,?,?)',
          [data.name, data.className, data.father, data.pNumber, data.imagex]);

      await get();
    } catch (e) {
      log('Error inserting data: $e');
    }
    update();
    Get.toNamed('/home');
  }

  Future<void> get() async {
    await initializeDatabase();

    final result = await _db!.rawQuery("SELECT * FROM student");
    log('All Students data : $result');
    studentModelList.clear();
    for (var map in result) {
      final student = StudentModel.fromMap(map);
      studentModelList.add(student);
    }

    log('length: ${studentModelList.length}');
    update();
  }

  Future<void> editStudent({
    required int id,
    required String studentName,
    required String studentClass,
    required String studentFather,
    required String studentPhoneNo,
    required String studntPhoto,
  }) async {
    final updateData = {
      'name': studentName,
      'classname': studentClass,
      'father': studentFather,
      'pnumber': studentPhoneNo,
      'imagex': studntPhoto,
    };
    print(updateData);
    await _put(id, updateData);
  }

  Future<void> _put(int id, Map<String, dynamic> updateData) async {
    log('one edit function');
    // TODO: implement put
    try {
      await initializeDatabase();
      await _db!.update('student', updateData, where: 'id=?', whereArgs: [id]);
      await get();
      update();
    } catch (e) {
      print(e);
    }
    log('edit funcion ended');
    update();
    Get.toNamed('/home');
  }

  Future<void> delete(int id) async {
    // TODO: implement delete
 
    try {
        log('delete function started');
         await _db!.delete('student', where: 'id=?', whereArgs: [id]);
         await get();
         log('delete function ended');
    } catch (e) {
      
    }
  
 
  }
}
