import 'package:flutter/material.dart';

class StudentInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final TextInputType textInputType ;
  const StudentInputField({
    required this.textController,
    required this.hintText,
    super.key,
    this.textInputType = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: textController,
        obscureText: false,
        cursorColor: Color.fromARGB(255, 216, 216, 216),
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 102, 102, 102)),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            fillColor: const Color.fromARGB(255, 56, 56, 56),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
            keyboardType: textInputType,
            textCapitalization: TextCapitalization.words,
      ),
    );
  }
}
