import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';

import 'order_detail.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Container(
                child: Stack(children: [
                  GestureDetector(
                      child: Image.asset("assets/images/topshapeicon.png"),
                      onTap: () => Navigator.pop(context)),
                  Positioned(
                      top: 20,
                      left: 20,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ))
                ]),
              ),
              Center(
                child: Text(
                  "Orders",
                  style: TextStyle(
                      color: apptextcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: apptextcolor,
                              ),
                              color: apptextcolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: Text(
                              "View All",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: apptextcolor,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: Text(
                              "Pending",
                              style: TextStyle(color: apptextcolor),
                            ),
                          )),
                      onTap: () {
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) => pending()));
                      },
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.30,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: apptextcolor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: Text(
                            "Successfull",
                            style: TextStyle(color: apptextcolor),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 20,
                        // padding: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            color: apptextcolor,
                            border: Border.all(color: apptextcolor)),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: Text(
                              "Pending",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: MediaQuery.of(context).size.width - 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pain Relief Medicine",
                                  style: TextStyle(
                                      color: apptextcolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Pres From.",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Dr.Avinash",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTextColorSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Pres For.",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Akshay Malhotra",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTextColorSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text(
                              "11/03/2021\n11:30 AM",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: apptextcolor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                          width: 20,
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              color: apptextcolor,
                              border: Border.all(color: apptextcolor)),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 20,
                        // padding: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            color: apptextcolor,
                            border: Border.all(color: apptextcolor)),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: Text(
                              "Successful",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pain Relief Medicine",
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Pres From.",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          Text(
                                            "Dr.Avinash",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: appTextColorSecondary,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Pres For.",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          Text(
                                            "Akshay Malhotra",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: appTextColorSecondary,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                "11/03/2021\n11:30 AM",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetail()));
                        },
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                          width: 20,
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              color: apptextcolor,
                              border: Border.all(color: apptextcolor)),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 20,
                        // padding: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            color: apptextcolor,
                            border: Border.all(color: apptextcolor)),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: Text(
                              "Pending",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: MediaQuery.of(context).size.width - 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pain Relief Medicine",
                                  style: TextStyle(
                                      color: apptextcolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Pres From.",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Dr.Avinash",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTextColorSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Pres For.",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Akshay Malhotra",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTextColorSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text(
                              "11/03/2021\n11:30 AM",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: apptextcolor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                          width: 20,
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              color: apptextcolor,
                              border: Border.all(color: apptextcolor)),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 20,
                        // padding: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            color: apptextcolor,
                            border: Border.all(color: apptextcolor)),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: Text(
                              "Successful",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: MediaQuery.of(context).size.width - 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pain Relief Medicine",
                                  style: TextStyle(
                                      color: apptextcolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Pres From.",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Dr.Avinash",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTextColorSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Pres For.",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Akshay Malhotra",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTextColorSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text(
                              "11/03/2021\n11:30 AM",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: apptextcolor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                          width: 20,
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              color: apptextcolor,
                              border: Border.all(color: apptextcolor)),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 20,
                        // padding: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            color: apptextcolor,
                            border: Border.all(color: apptextcolor)),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: Text(
                              "Pending",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: MediaQuery.of(context).size.width - 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pain Relief Medicine",
                                  style: TextStyle(
                                      color: apptextcolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Pres From.",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Dr.Avinash",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTextColorSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Pres For.",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "Akshay Malhotra",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appTextColorSecondary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text(
                              "11/03/2021\n11:30 AM",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: apptextcolor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                          width: 20,
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              color: apptextcolor,
                              border: Border.all(color: apptextcolor)),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomTabs(2, true),
    );
  }
}
