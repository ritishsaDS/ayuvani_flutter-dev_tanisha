import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/ui/chemist/login/bloc/chemist_login_bloc.dart';
import 'package:flutter_ayuvani/ui/chemist/view_history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/chemist_drawer.dart';
import '../chemist_bottom_bar.dart';
import '../orders.dart';
import '../orderstatus.dart';
import '../update_status.dart';

class ChemistDashboardScreen extends StatefulWidget {
  static const route = '/ChemistDashboardScreen';
  @override
  _ChemistDashboardScreenState createState() => _ChemistDashboardScreenState();
}

class _ChemistDashboardScreenState extends State<ChemistDashboardScreen> {
  var _selectedIndex = 0;
  String storeName;
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTappped(int value) {
      setState(() {
        _selectedIndex = value;
      });
    }

    storeName = context.watch<ChemistLoginBloc>().chemistLoginModel.data.name;
    return Scaffold(
      drawer: ChemistDrawer(),
      body: SafeArea(
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/bg.png"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Container(
            margin: EdgeInsets.all(15),
            child: ListView(
              children: [
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: apptextcolor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(SampleProfileImageUrl),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      " ˇ  Punjab",
                      style: TextStyle(
                          color: apptextcolor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: SizedBox()),
                    Image.asset(
                      "assets/bell.png",
                      height: 25,
                      width: 25,
                    )
                  ],
                )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Wednesday, 10 March",
                    style: TextStyle(color: apptextcolor),
                  ),
                ),
                Container(
                  child: Text(
                    "Hi , ${storeName.toUpperCase()}",
                    style: TextStyle(
                        color: apptextcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/tile.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Number of Orders",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        "15",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/tile.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pending Orders\n5",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        "Complete Orders\n10",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 250,
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: apptextcolor),
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          Positioned(
                              left: 75,
                              top: 12,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Icon(
                                      Icons.circle,
                                      color: apptextcolor,
                                      size: 12,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        bottom: 10, right: 10, left: 10),
                                    color: Colors.white,
                                    child: Text(
                                      '  What are you Looking for',
                                      style: TextStyle(
                                        color: apptextcolor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Icon(
                                      Icons.circle,
                                      color: apptextcolor,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                        child: Column(
                          children: [
                            GestureDetector(
                                child: Card(
                                  elevation: 2,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 5,
                                              bottom: 5),
                                          child: Image.asset(
                                            "assets/healthrecordicon.png",
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        Text(
                                          "Orders",
                                          style: TextStyle(
                                              color: apptextcolor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          color: apptextcolor,
                                        )
                                      ]),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Order()));
                                }),
                            SizedBox(
                              height: 7,
                            ),
                            GestureDetector(
                              child: Card(
                                elevation: 2,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        child: Image.asset(
                                          "assets/record upload icon.png",
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                      Text(
                                        "Upload Status",
                                        style: TextStyle(
                                            color: apptextcolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: apptextcolor,
                                      )
                                    ]),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateStatus()));
                              },
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            GestureDetector(
                              child: Card(
                                elevation: 2,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        child: Image.asset(
                                          "assets/med. status icon.png",
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                      Text(
                                        "Order Status",
                                        style: TextStyle(
                                            color: apptextcolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: apptextcolor,
                                      )
                                    ]),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrderStatus()));
                              },
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            GestureDetector(
                              child: Card(
                                elevation: 2,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        child: Image.asset(
                                          "assets/med. status icon.png",
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                      Text(
                                        "View History",
                                        style: TextStyle(
                                            color: apptextcolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: apptextcolor,
                                      )
                                    ]),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewHistory()));
                              },
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ChemistBottomNav(1, true),
    );
  }

  showIndicator(bool show) {
    return show
        ? Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Icon(Icons.brightness_1, size: 10, color: Colors.orange),
          )
        : SizedBox();
  }
}
