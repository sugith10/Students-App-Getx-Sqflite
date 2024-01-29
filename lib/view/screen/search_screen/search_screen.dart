import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
            )),
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 82, 82, 82), borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded, color: Color.fromARGB(255, 36, 36, 36),),
                 
                    suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.clear_rounded, color: Color.fromARGB(255, 36, 36, 36),))
                , hintText: 'Search',
                border: InputBorder.none
                
                  ),
                ),
              ),
            ),
            // bottom: Divider(),
      ),
    );
  }
}
