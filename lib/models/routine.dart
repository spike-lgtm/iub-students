import 'package:iub_students/models/course.dart';

class Routine {
  List<Course> sunday;
  List<Course> monday;
  List<Course> tuesday;
  List<Course> wednesday;
  List<Course> thursday;
  List<Course> friday;
  List<Course> saturday;

  Routine({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  factory Routine.fromJson(Map<String, dynamic> json) {
    return Routine(
      sunday: parseCourseList(json['Sunday']),
      monday: parseCourseList(json['Monday']),
      tuesday: parseCourseList(json['Tuesday']),
      wednesday: parseCourseList(json['Wednesday']),
      thursday: parseCourseList(json['Thursday']),
      friday: parseCourseList(json['Friday']),
      saturday: parseCourseList(json['Saturday']),
    );
  }
  List<Course> getCourseList(int dayOfWeek) {
    List<Course> courses;
    switch (dayOfWeek) {
      case 1:
        courses = sunday;
        break;
      case 2:
        courses = monday;
        break;
      case 3:
        courses = tuesday;
        break;
      case 4:
        courses = wednesday;
        break;
      case 5:
        courses = thursday;
        break;
      case 6:
        courses = friday;
        break;
      case 7:
        courses = saturday;
        break;
      default:
        throw Exception('Invalid day of week');
    }

    courses.sort((a, b) => a.startTime.compareTo(b.startTime));
    return courses;
  }

  static List<Course> parseCourseList(List<dynamic> list) {
    return list.map((item) => Course.fromJson(item)).toList();
  }
}
