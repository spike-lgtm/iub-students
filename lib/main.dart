import 'package:flutter/material.dart';
import 'package:iub_students/UI/login.dart';
import 'package:iub_students/UI/screen_wrapper.dart';
import 'package:iub_students/models/announcement.dart';
import 'package:iub_students/models/routine.dart';
import 'package:iub_students/models/student_info.dart';
import 'package:iub_students/temp.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: "IUB Students",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<AppContext>(
          future: getAppContext(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData) {
              return ScreenWrapper(appContext: snapshot.data!);
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error Processing Data, Please try again!"),);
            } else {
              return Scaffold(
                body: Center(
                  child: LoadingAnimationWidget.prograssiveDots(
                    color: const Color(0xff3347B0),
                    size: 75,
                  ),
                ),
              );
            }
          },

        ),
      ),
    );
  }

  Future<AppContext> getAppContext() async {
    await Future.delayed(const Duration(seconds: 1));
    return AppContext.fromJson(tempData);
  }
}


class AppContext {
  StudentInfo studentInfo;
  Routine routine;
  List<Announcement> announcements;

  AppContext({
    required this.studentInfo,
    required this.routine,
    required this.announcements,
  });

  factory AppContext.fromJson(Map<String, dynamic> json) {
    return AppContext(
      studentInfo: StudentInfo.fromJson(json['student_info']),
      routine: Routine.fromJson(json['routine']),
      announcements: parseAnnouncementList(json['announcements']),
    );
  }

  static List<Announcement> parseAnnouncementList(List<dynamic> list) {
    return list.map((item) => Announcement.fromJson(item)).toList();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}

