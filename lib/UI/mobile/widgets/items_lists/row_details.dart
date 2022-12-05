import 'package:flutter/material.dart';

class RowDetails extends StatelessWidget {
  const RowDetails({required this.title, required this.content, Key? key})
      : super(key: key);

  final String title;
  final dynamic content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, bottom: 5),
      child: Row(children: [
        Text(
          "$title: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          "$content",
          style: const TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis),
        )
      ]),
    );
  }
}
