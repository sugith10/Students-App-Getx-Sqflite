import 'package:flutter/material.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
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
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
            onPressed: () {},
            child: const Text(
              ' Grid View ',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
