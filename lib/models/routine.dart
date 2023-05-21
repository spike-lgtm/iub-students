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
    switch (dayOfWeek) {
      case 1:
        return monday;
      case 2:
        return tuesday;
      case 3:
        return wednesday;
      case 4:
        return thursday;
      case 5:
        return friday;
      case 6:
        return saturday;
      case 7:
        return sunday;
      default:
        throw Exception('Invalid day of week');
    }
  }

  static List<Course> parseCourseList(List<dynamic> list) {
    return list.map((item) => Course.fromJson(item)).toList();
  }
}
