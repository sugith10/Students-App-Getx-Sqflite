import 'package:flutter/material.dart';
import 'package:student_app/controller/screen_controller/navigation_controller/screen_navigations/add_screen_navigation.dart';
import 'package:student_app/controller/screen_controller/navigation_controller/screen_navigations/view_student_data_screen.dart';
import 'package:student_app/screens/widgets/card_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Students Data',
          style: TextStyle(fontFamily: 'poppins'),
        ),
        actions: const [
          Icon(
            Icons.search_rounded,
            color: Color.fromARGB(255, 114, 143, 170),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () => ViewStudentDataScrnNav()
                  .toViewStudentDataLeftToRight(context),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0, 
                    ),
                    borderRadius: BorderRadius.circular(10)),
                height: 100,
                child: const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(5),
                    //   child: Image.network(
                    //     name,
                    //     width: 80,
                    //     height: 80,
                    //   ),
                    // ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoWidget(
                          text: 'Sugith K',
                          fontSize: 20,
                          padding: 10,
                        ),
                        InfoWidget(
                          text: '10',
                          fontSize: 20,
                          padding: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 47, 47, 50),
        onPressed: () {
          AddScreenNavigation().toAddScreenLeftToRight(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
