import 'package:flutter/material.dart';

import '../view/drawer menu/about_screen.dart';
import '../view/drawer menu/mytrips_screen.dart';
import '../view/drawer menu/payment_screen.dart';
import '../view/drawer menu/profile_screen.dart';
import '../view/drawer menu/promotion_screen.dart';

import 'list_tiles.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: h / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/profile.jpg',
                      ),
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("John", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(fontSize: 11),
                      ))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                list_tiles(
                  title: "Payment",
                  icon: Icon(Icons.payment),
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentScreen()));
                  },
                ),
                list_tiles(
                  title: "Support",
                  icon: Icon(Icons.contact_support_outlined),
                  function: () {},
                ),
                list_tiles(
                  title: "My Trips",
                  icon: Icon(Icons.timelapse_rounded),
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyTripsScreen()));
                  },
                ),
                list_tiles(
                  title: "About",
                  icon: Icon(Icons.info_rounded),
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutScreen()));
                  },
                ),
              ],
            ),
          ),
          Divider(
            thickness: 5,
          )
        ],
      ),
    );
  }
}
