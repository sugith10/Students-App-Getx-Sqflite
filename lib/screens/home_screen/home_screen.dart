import 'package:flutter/material.dart';
import 'package:student_app/screens/widgets/card_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final String name =
      'https://media.licdn.com/dms/image/D5603AQHL6xrN6LW9dA/profile-displayphoto-shrink_200_200/0/1696985633177?e=2147483647&v=beta&t=faFj8AwSXIHUyO74pF7DJYrq_uYXQkHgNn88cJgvHlg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Data'),
        actions: const [
          Icon(Icons.nightlight_round),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 77, 77, 77),
                    borderRadius: BorderRadius.circular(10)),
                height: 100,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          name,
                          width: 80,
                          height: 80,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
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
            )
          ],
        ),
      ),
    );
  }
}
