import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/db_controller/student_db_controller/data_list.dart';
import 'package:student_app/model/db_student_model.dart';
import 'package:student_app/view/screen/search_screen/search_screen.dart';
import 'package:student_app/view/screen/view_student_screen/view_student_scrn.dart';
import 'package:student_app/view/widgets/card_view.dart';
import 'package:student_app/view/widgets/select_category.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final StudentDataList controller = Get.put(StudentDataList());

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
              init: StudentDataList(), 
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.studentModelList.length,
                  itemBuilder: (context, index) {
                    final studentModel = controller.studentModelList[index];
                    return ListTileWidget(
                      index: index,
                     studentModel: studentModel ,
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
  final StudentModel studentModel;
 
  final int index;

  const ListTileWidget({
    Key? key,
    required this.studentModel,
    required this.index,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: doNothing(),
            backgroundColor: Color.fromARGB(255, 244, 69, 69),
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
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: doNothing(),
            backgroundColor: Color.fromARGB(255, 1, 213, 75),
            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            icon: Icons.edit_document,
            label: 'Edit',
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
        ],
      ),
      child: StudentCard(studentModel: studentModel),
    );
  }
}

removeData(BuildContext context, int index) {
  // studentModelList.removeAt(index);
}

doNothing() {}

class StudentCard extends StatelessWidget {
  final StudentModel studentModel;
  const StudentCard({
    super.key,
    required this.studentModel,
   
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          Get.to(ViewStudentDataScrn(studentModel: studentModel,));
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
