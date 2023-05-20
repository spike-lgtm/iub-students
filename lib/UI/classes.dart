import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Classes extends StatefulWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Your Classes",
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 600,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRoutine(),
            )),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  String buildCourseText(String text) {
    if (text.length < 22) {
      return text;
    } else {
      return "${text.substring(0, 21)}...";
    }
  }

  String buildDayText(int i) {
    if (i == 0) {
      return "Today";
    } else if (i == 1) {
      return "Tomorrow";
    } else {
      return DateFormat('dd MMMM, EEEE')
          .format(DateTime.now().add(Duration(days: i)))
          .toString();
    }
  }

  List<Widget> _buildRoutine() {
    List<Widget> widgets = [];
    for (int i = 0; i < 7; i++) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                buildDayText(i),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity, // Sets the width to the screen width
                height: 90,
                color: const Color(0xffEBF1F8),
                child: Row(
                  children: [
                    Container(
                      color: const Color(0xff2F599A),
                      height: double.infinity,
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CSC101",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            buildCourseText("Introduction to Computer Science"),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("09:40AM - 11:00AM",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Room",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                          Text("BCA120",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return widgets;
  }
}
