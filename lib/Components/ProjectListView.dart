import 'package:flutter/material.dart';
import './ProfileImageAvatar.dart';
import './ImageOverlap.dart';
import './CustomProgressBar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectListView extends StatefulWidget {
  const ProjectListView({super.key, required this.ProjectList});

  final List<Map> ProjectList;

  @override
  State<ProjectListView> createState() => _ProjectListView();
}

class _ProjectListView extends State<ProjectListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 14),
      itemCount: widget.ProjectList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromRGBO(142, 142, 142, 0.8).withOpacity(0.8),
                spreadRadius: -2,

                blurRadius: 4,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      ProfileImageAvatar(
                        imageUrl: widget.ProjectList[index]["ImageUrl"],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.ProjectList[index]["ProjectName"],
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14)),
                      )
                    ]),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                        size: 16.0,
                      ),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 12),
                    child: Text(widget.ProjectList[index]["Description"],
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12)))),
                ImageOverlap(
                    ImageUrlList: widget.ProjectList[index]["UserImages"]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      padding: EdgeInsets.fromLTRB(5, 4, 5, 4),
                      height: 26,
                      width: 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 211, 211, 211),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.red),
                          ),
                          Text(
                            "${widget.ProjectList[index]["Priority"]} priority",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.ProjectList[index]["Status"] == "ToDo"
                          ? "Pending"
                          : "Work on",
                      style: TextStyle(
                          color: widget.ProjectList[index]["Status"] == "ToDo"
                              ? Color.fromARGB(255, 255, 138, 0)
                              : Color.fromARGB(255, 0, 212, 21),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                CustomProgressBar(
                  Progress: widget.ProjectList[index]["Progress"],
                )
              ]),
        );
      },
    );
  }
}
