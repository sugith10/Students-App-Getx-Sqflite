import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/db_controller/student_db_controller/student_db_controller.dart';
import 'package:student_app/controller/getx_controller/view_switch_get_cntrl.dart';
import 'package:student_app/model/db_student_model.dart';
import 'package:student_app/view/screen/search_screen/search_screen.dart';
import 'package:student_app/view/screen/view_student_screen/view_student_scrn.dart';
import 'package:student_app/view/widgets/card_view.dart';
import 'package:student_app/view/widgets/select_category.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  StudentDataCntrl controller = Get.put(
    StudentDataCntrl(),
  );

  ViewControl viewControl = Get.put(ViewControl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Students Data'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const SearchScreen());
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Center(
              child: SelectCategoryWidget(),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: controller.get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Obx(() {
                    return viewControl.view.isFalse
                        ? ListView.builder(
                            itemCount: controller.studentModelList.length,
                            itemBuilder: (context, index) {
                              final studentModel =
                                  controller.studentModelList[index];
                              return ListTileWidget(
                                studentModel: studentModel,
                                controller: controller,
                              );
                            },
                          )
                        : GridView.builder(
                            itemCount: controller.studentModelList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              final studentModel =
                                  controller.studentModelList[index];
                              return StudentGridItem(
                                  studentModel: studentModel);
                            });
                  });
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 47, 47, 50),
        onPressed: () {
          Get.toNamed('/addStudent');
          log('Data in the list ${controller.studentModelList.length}');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final StudentModel studentModel;
  final StudentDataCntrl controller;

  const ListTileWidget({
    Key? key,
    required this.studentModel,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => controller.delete(studentModel.id!),
            backgroundColor: const Color.fromARGB(255, 244, 69, 69),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: deleteData(),
            backgroundColor: const Color.fromARGB(255, 1, 213, 75),
            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            icon: Icons.edit_document,
            label: 'Edit',
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
        ],
      ),
      child: StudentListCard(studentModel: studentModel),
    );
  }

  deleteData() {}
}

class StudentListCard extends StatelessWidget {
  final StudentModel studentModel;
  const StudentListCard({
    super.key,
    required this.studentModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Get.to(
            ViewStudentDataScrn(
              studentModel: studentModel,
            ),
          transition:  Transition.leftToRightWithFade,
          duration: const Duration(milliseconds: 400),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 100,
          child: Row(
            children: [
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoWidget(
                    text: studentModel.name,
                    fontSize: 20,
                    padding: 10,
                  ),
                  InfoWidget(
                    text: studentModel.className,
                    fontSize: 20,
                    padding: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentGridItem extends StatelessWidget {
  final StudentModel studentModel;

  const StudentGridItem({
    Key? key,
    required this.studentModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Get.to(
            ViewStudentDataScrn(
              studentModel: studentModel,
            ),
          transition:  Transition.leftToRightWithFade,
          duration: const Duration(milliseconds: 400),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Row(
            children: [
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoWidget(
                    text: studentModel.name,
                    fontSize: 20,
                    padding: 10,
                  ),
                  InfoWidget(
                    text: studentModel.className,
                    fontSize: 17,
                    padding: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
