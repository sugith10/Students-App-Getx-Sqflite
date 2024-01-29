import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/getx_controller/view_switch_get_cntrl.dart';

class SelectCategoryWidget extends StatelessWidget {
  SelectCategoryWidget({
    super.key,
  });

  ViewControl viewControl = Get.put(ViewControl());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewControl>(
      builder: (context) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: OutlinedButton(
                onPressed: () {
                  log('list');
                  viewControl.listView();
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                  backgroundColor: viewControl.view.value == false
                      ? Color.fromARGB(255, 78, 77, 77)
                      : Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                ),
                child: const Text(
                  ' List View ',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  backgroundColor: viewControl.view.value == true
                      ? Color.fromARGB(255, 78, 77, 77)
                      : Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                ),
                onPressed: () {
                  log('grid');
                  viewControl.gridView();
                },
                child: const Text(
                  ' Grid View ',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
