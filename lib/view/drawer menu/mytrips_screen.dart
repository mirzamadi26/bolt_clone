import 'package:flutter/material.dart';

import '../../widgets/myTrips_tile.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Trips",
          style: TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white38,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black54, size: 15),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apr 2023",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  myTrips_tile(
                      text: "Paris, France",
                      date: '30 April, 12:20',
                      price: "12.00£",
                      tripStatus: "Trip Cancelled"),
                  myTrips_tile(
                      text: "Nice, France",
                      date: '2 April, 12:20',
                      price: "14.00£",
                      tripStatus: "Trip Completed")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
