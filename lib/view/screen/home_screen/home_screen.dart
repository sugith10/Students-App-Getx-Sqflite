import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/db_controller/student_db_controller/data_list.dart';
import 'package:student_app/view/screen/search_screen/search_screen.dart';
import 'package:student_app/view/widgets/card_view.dart';
import 'package:student_app/view/widgets/select_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Students Data'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
            child: Center(
              child: SelectCategoryWidget(),
            ),
          ),
          Expanded(
            child: GetX<StudentDataList>(
              init: StudentDataList(), // Initialize the controller
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.studentModelList.length,
                  itemBuilder: (context, index) {
                    final studentModel = controller.studentModelList[index];
                    return ListTileWidget(
                      index: index,
                      studentName: studentModel.name,
                      studentClass: studentModel.className,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 47, 47, 50),
        onPressed: () {
          Get.toNamed('/addStudent');
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
  final String studentName;
  final String studentClass;
  final int index;

  const ListTileWidget({
    Key? key,
    required this.index,
    required this.studentName,
    required this.studentClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: doNothing(),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: doNothing(),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
        ],
      ),
      child: StudentCard(studentName: studentName, studentClass: studentClass),
    );
  }
}

removeData(BuildContext context, int index) {
  // studentModelList.removeAt(index);
}

doNothing() {}

class StudentCard extends StatelessWidget {
  const StudentCard({
    super.key,
    required this.studentName,
    required this.studentClass,
  });

  final String studentName;
  final String studentClass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () {},
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
                    text: studentName,
                    fontSize: 20,
                    padding: 10,
                  ),
                  InfoWidget(
                    text: studentClass,
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
