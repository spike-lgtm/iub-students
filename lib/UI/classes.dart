import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iub_students/models/course.dart';
import 'package:iub_students/models/routine.dart';

class Classes extends StatefulWidget {
  final Routine routine;

  const Classes({Key? key, required this.routine}) : super(key: key);

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
          const Text(
            "Your Classes",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
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
      List<Course> coursesThisDay = widget.routine
          .getCourseList(DateTime.now().add(Duration(days: i)).weekday);
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
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              for (int j = 0; j < coursesThisDay.length; j++)
                _buildCourseWidget(coursesThisDay[j]),
              if (coursesThisDay.isEmpty)
                Text("You don't have any class on this day.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400, fontStyle: FontStyle.italic))
            ],
          ),
        ),
      );
    }
    widgets.add(const SizedBox(height: 20));
    return widgets;
  }

  Widget _buildCourseWidget(Course course) {
    return Column(
      children: [
        Container(
          width: double.infinity, // Sets the width to the screen width
          height: MediaQuery.of(context).size.height * 0.12,
          color: const Color(0xffEBF1F8),
          child: Row(
            children: [
              Container(
                color: const Color(0xff2F599A),
                height: double.infinity,
                width: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.code,
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        buildCourseText(course.name),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "${convertToAmPm(course.startTime)} - ${convertToAmPm(course.endTime)}",
                          style: TextStyle(fontSize: 14, color: Colors.black54))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Room",
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                      Text(course.room,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  String convertToAmPm(String time) {
    // Split the time into hours and minutes
    List<String> parts = time.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);

    // Determine if it's AM or PM
    String period = hours >= 12 ? 'PM' : 'AM';

    // Convert hours to 12-hour format
    hours = hours > 12 ? hours - 12 : hours;
    if (hours == 0) {
      hours = 12;
    }

    // Format the time with leading zeros for single-digit hours and minutes
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';

    // Return the time with AM/PM
    return '$formattedTime$period';
  }
}
