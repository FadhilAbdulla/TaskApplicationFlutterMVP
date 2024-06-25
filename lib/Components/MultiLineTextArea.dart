import 'package:flutter/material.dart';

class MultiLineTextArea extends StatefulWidget {
  const MultiLineTextArea(
      {super.key, required this.HintText, required this.Title});

  final String HintText;
  final String Title;
  @override
  State<MultiLineTextArea> createState() => _MultiLineTextArea();
}

class _MultiLineTextArea extends State<MultiLineTextArea> {
  String? _selectedProject;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.Title,
          style: TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 180, 180, 180),
              fontWeight: FontWeight.w600),
        ),
        Container(
          width: 400,
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: TextField(
            maxLines: 3,
            // controller: myController,
            style: TextStyle(fontSize: 12), // Set font size here

            decoration: InputDecoration(
                hintText: widget.HintText,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(160, 197, 197, 197),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(159, 86, 86, 86),
                    width: 1.0,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}