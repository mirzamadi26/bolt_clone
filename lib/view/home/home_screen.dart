import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rider/utils/app_colors.dart';
import 'package:rider/widgets/button_widget.dart';
import 'package:rider/widgets/textfield_location.dart';
import 'package:rider/widgets/textfield_widget.dart';

import '../../widgets/drawer_icon.dart';
import '../../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TextEditingController whereToController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  static final CameraPosition _cameraPosition = const CameraPosition(
      zoom: 14, target: LatLng(48.85235334221507, 2.3416817936822154));

  Completer<GoogleMapController> _controller = Completer();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  double _percent = 0.0;
  double h = 100;
  double w = double.maxFinite;
  Color? color;
  bool isShow1 = false;
  bool isShow2 = false;
  double rideContainerHeight = 0;
  double rideDetailsSheetHeight = 0;
  double rideDetailsSheetMaxHeight = 0;

  double searchSheetHeight = 0.22;
  double confirmRideHeight = 0;
  double driveConnectSheetHeight = 0;
  int index = 1;
  List cars = [
    {'id': 0, 'name': 'Uber Go', 'price': 15},
    {'id': 1, 'name': 'Go Saden', 'price': 230},
    {'id': 2, 'name': 'UberXL', 'price': 400},
    {'id': 3, 'name': 'Uber Auto', 'price': 150},
    {'id': 4, 'name': "Rider", 'price': 150},
  ];

  void showDetailSheet() {
    setState(() {
      searchSheetHeight = 0;
      rideDetailsSheetHeight = 0.4;
      rideDetailsSheetMaxHeight = 0.9;
      rideContainerHeight = 100;
    });
  }

  void showConfirmSheet() {
    setState(() {
      rideDetailsSheetHeight = 0;
      rideDetailsSheetMaxHeight = 0;
      rideContainerHeight = 0;
      confirmRideHeight = 0.38;
    });
  }

  void showDriverConnectSheet() {
    setState(() {
      confirmRideHeight = 0;
      driveConnectSheetHeight = 0.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.68,
        child: SingleChildScrollView(
          child: Column(
            children: const [MyDrawerHeader()],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: _cameraPosition,
          ),
          Positioned(
            left: 10,
            top: 20,
            child: drawer_icon(
              function: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),

//Confirm Order

// Book Car BottomSheet

// Select Desitination

          AnimatedSize(
            vsync: this,
            duration: Duration(milliseconds: 150),
            curve: Curves.easeIn,
            child: DraggableScrollableSheet(
                minChildSize: searchSheetHeight,
                initialChildSize: searchSheetHeight,
                maxChildSize: 0.4,
                builder: ((context, scrollController) {
                  return Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 30,
                                child: Divider(
                                  thickness: 3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your Route",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  LocationTextFieldWidget(
                                      controllerName: whereToController,
                                      klabelText: "Search pick-up location"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  LocationTextFieldWidget(
                                      controllerName: whereToController,
                                      klabelText: "Destination"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ButtonWidget(
                                      backgroundColor: AppColors.mainColor,
                                      text: "Confirm",
                                      textColor: Colors.white,
                                      function: () {
                                        showDetailSheet();
                                      })
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
                })),
          ),
//Ride Detail sheet
          AnimatedSize(
            vsync: this,
            duration: Duration(milliseconds: 150),
            curve: Curves.easeIn,
            child: DraggableScrollableSheet(
                minChildSize: rideDetailsSheetHeight,
                initialChildSize: rideDetailsSheetHeight,
                maxChildSize: rideDetailsSheetMaxHeight,
                builder: ((context, scrollController) {
                  return Container(
                      color: Colors.white,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: cars.length,
                        itemBuilder: ((context, index) {
                          final car = cars[index];
                          if (index == 0) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: Divider(
                                    thickness: 3,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          }
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColors.mainColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    child: ListTile(
                                        onTap: () {
                                          setState(() {
                                            color = Colors.green[100];
                                          });
                                        },
                                        visualDensity: VisualDensity(
                                            horizontal: 0, vertical: -4),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 0),
                                        leading:
                                            Icon(Icons.time_to_leave_sharp),
                                        subtitle: Text(
                                          "2 min",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        title: Text(car['name'],
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold)),
                                        trailing: Text(
                                          "${car['price'].toString()} £",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                                Divider(
                                  thickness: 0.3,
                                )
                              ],
                            ),
                          );
                        }),
                      ));
                })),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 5,
              child: Container(
                height: rideContainerHeight,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.payment_rounded,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: EdgeInsets.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Cash",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  Icon(Icons.keyboard_arrow_down_sharp)
                                ],
                              ),
                              Text(
                                "Personal Trip",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(
                          backgroundColor: AppColors.mainColor,
                          text: "Book Go Saden",
                          textColor: Colors.white,
                          function: () {
                            showConfirmSheet();
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Confirm Ride
          AnimatedSize(
            vsync: this,
            duration: Duration(milliseconds: 150),
            curve: Curves.easeIn,
            child: DraggableScrollableSheet(
                minChildSize: confirmRideHeight,
                initialChildSize: confirmRideHeight,
                maxChildSize: 0.5,
                builder: ((context, scrollController) {
                  return Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Paris",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.cancel))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("12.4£"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Comfort")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                TextFieldIcons(
                                    pIcon: Icon(Icons.note_alt_sharp),
                                    controllerName: noteController,
                                    klabelText:
                                        "Add note for driver (optional)"),
                                SizedBox(
                                  height: 10,
                                ),
                                ButtonWidget(
                                    backgroundColor: AppColors.mainColor,
                                    text: "Confirm Order",
                                    textColor: Colors.white,
                                    function: () {
                                      showDriverConnectSheet();
                                    })
                              ],
                            ),
                          ],
                        ),
                      ));
                })),
          ),
          AnimatedSize(
            vsync: this,
            duration: Duration(milliseconds: 150),
            child: DraggableScrollableSheet(
                minChildSize: driveConnectSheetHeight,
                initialChildSize: driveConnectSheetHeight,
                maxChildSize: 0.52,
                builder: ((context, scrollController) {
                  return Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15, right: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 30,
                                child: Divider(
                                  thickness: 3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Connection to your driver",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "The driver will be on their way as soon as they confirm",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: LoadingAnimationWidget
                                        .horizontalRotatingDots(
                                            color: AppColors.mainColor,
                                            size: 30),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/profile.jpg')),
                                          SizedBox(height: 20),
                                          Text("John")
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.cancel,
                                                size: 40,
                                              )),
                                          SizedBox(height: 10),
                                          Text("Cancel trip")
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Divider(
                                    thickness: 2,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.payment_rounded,
                                              color: AppColors.mainColor,
                                            ),
                                            label: Text("Cash")),
                                        Text(
                                          "12.40£",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ])
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
                })),
          ),
        ],
      ),
    );
  }
}
