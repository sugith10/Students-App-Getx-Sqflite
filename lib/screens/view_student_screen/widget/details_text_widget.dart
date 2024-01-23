import 'package:flutter/material.dart';

class DetailsTextWidget extends StatelessWidget {
  final String head;
  final String body;
  const DetailsTextWidget({
    required this.head, required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$head:',
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 25,
          ),
          
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          body,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 25,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
