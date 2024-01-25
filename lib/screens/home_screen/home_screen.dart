import 'package:flutter/material.dart';
import 'package:student_app/controller/screen_controller/navigation_controller/screen_navigations/add_screen_navigation.dart';
import 'package:student_app/controller/screen_controller/navigation_controller/screen_navigations/view_student_data_screen.dart';
import 'package:student_app/screens/search_screen/search_screen.dart';
import 'package:student_app/screens/widgets/card_view.dart';
import 'package:student_app/screens/widgets/select_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 108, 108, 108),
      appBar: AppBar(
    //  backgroundColor: const Color.fromARGB(255, 108, 108, 108),
        automaticallyImplyLeading: false,
        title: const Text(
          'Students Data',
          style: TextStyle(fontFamily: 'poppins'),
        ),
        actions: [
         IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
         }, icon: Icon(Icons.search_rounded))
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
          SingleChildScrollView(
            child: Column(
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 100,
                      child: const Row(
                        children: [
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
          ),
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
