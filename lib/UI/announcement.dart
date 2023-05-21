import 'package:flutter/material.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Announcements",
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
          Container(
            width: double.infinity, // Sets the width to the screen width
            height: 90,
            color: const Color(0xffEBF1F8),
            child: Row(
              children: [
                Container(
                  color: const Color(0xff3347B0),
                  height: double.infinity,
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 240,
                    child: SingleChildScrollView(
                      child: Text(
                        "Summer 23 academic calendar ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(icon: Icon(Icons.navigate_next, size: 35,), onPressed: () {

                  },)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
