import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.ListItem,
      required this.Title,
      required this.onSelectionChanged,
      this.defaultValue});

  final List<String> ListItem;
  final String Title;
  final void Function(String?) onSelectionChanged;
  final String? defaultValue;

  @override
  State<CustomDropDown> createState() => _CustomDropDown();
}

class _CustomDropDown extends State<CustomDropDown> {
  String? _selectedProject;

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null &&
        widget.defaultValue!.isNotEmpty &&
        widget.ListItem.contains(widget.defaultValue)) {
      setState(() {
        _selectedProject = widget.defaultValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.Title,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity, // Full width
          height: 37, // Set height
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromARGB(255, 153, 153, 153), width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            isExpanded: true, // Full width
            icon: Icon(Icons.keyboard_arrow_down), // Custom arrow icon
            iconSize: 24, // Size of the icon
            underline: SizedBox(), // Removes the default underline
            value: _selectedProject,
            // hint: Text("Select a project",st),
            onChanged: (String? newProject) {
              setState(() {
                _selectedProject = newProject;
                widget.onSelectionChanged(newProject);
              });
            },
            items: widget.ListItem.map((String project) {
              return DropdownMenuItem<String>(
                value: project,
                alignment: Alignment.centerLeft,
                child: Text(
                  project,
                  style: TextStyle(
                    fontSize: 13, // Adjust text size as needed
                  ),
                ),
              );
            }).toList(),
            selectedItemBuilder: (BuildContext context) {
              return widget.ListItem.map<Widget>((String project) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    project,
                    style: TextStyle(
                      fontSize: 13, // Adjust text size as needed
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ),
      ],
    );
  }
}
