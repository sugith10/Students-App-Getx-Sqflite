import 'package:flutter/material.dart';
import 'package:student_app/view/screen/view_student_screen/widget/details_text_widget.dart';

class ViewStudentDataScrn extends StatelessWidget {
  const ViewStudentDataScrn({super.key});

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
              const DetailsTextWidget(head: 'Student Name' , body: 'Sugith',),
              const SizedBox(
                height: 20,
              ),
               const DetailsTextWidget(head: 'Student Class', body: 'Plus Two',),
                  const SizedBox(
                height: 20,
              ),
               const DetailsTextWidget(head: 'Parent Name', body: 'Plus Two',),
                const SizedBox(
                height: 20,
              ),
               const DetailsTextWidget(head: 'Student Mobile No', body: '1234567891',),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 47, 47, 50),
        onPressed: () {
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

