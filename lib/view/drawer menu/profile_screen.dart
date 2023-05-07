import 'package:flutter/material.dart';
import 'package:rider/view/drawer%20menu/work_location.dart';

import '../../widgets/list_tiles.dart';
import '../../widgets/profile_widget.dart';
import 'edit_profile_screen.dart';
import 'home_location_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen()));
                },
                icon: Icon(Icons.edit))
          ],
          backgroundColor: Colors.white38,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.black54, size: 15),
          elevation: 0,
        ),
        body: ListView(children: [
          Container(
            width: double.maxFinite,
            height: h / 4.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/profile.jpg',
                        ),
                      )),
                ),
                Text("John", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "+432523522",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    thickness: 5,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Favorite Location",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                list_tiles(
                    title: "Enter home location",
                    icon: Icon(Icons.home_filled),
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeLocationScreen()));
                    }),
                Divider(),
                list_tiles(
                    title: "Enter work location",
                    icon: Icon(Icons.work_outline_rounded),
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkLocationScreen()));
                    }),
                Divider(
                  thickness: 5,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                list_tiles(
                  title: "Language",
                  function: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Divider(thickness: 5),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15,
            ),
            child: Column(children: [
              list_tiles(
                  title: "Log out", icon: Icon(Icons.login), function: () {}),
              Divider(),
              list_tiles(
                  title: "Delete Account",
                  icon: Icon(Icons.delete),
                  function: () {}),
            ]),
          )
        ]));
  }
}
