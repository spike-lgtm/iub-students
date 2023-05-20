import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: getGreeting("Khalid"),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
                TextSpan(
                  text: 'Khalid',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ],
            ),
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
          SizedBox(height: 10),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 550.0,
            color: const Color(0xff3347B0),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Colors.white,
                        size: 60,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("object");
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Center(
                            child: Text(
                              'Update Info',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current CGPA",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "3.97",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Credits Completed",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "68",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1, color: Colors.white,),

                  SizedBox(height: 40),
                  SizedBox(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        pause: Duration(seconds: 1),
                        animatedTexts: [
                          TyperAnimatedText('The best time to plant a tree was 20'
                              ' years ago. The second best time is now.'),

                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Please press update info to fetch data from IRAS',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  String getGreeting(String name) {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning, ';
    } else if (hour < 17) {
      return 'Good afternoon, ';
    } else {
      return 'Good evening, ';
    }
  }
}
