import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';

class ViewHistory extends StatefulWidget {
  @override
  _ViewHistoryState createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: ListView(children: [
        Container(
          child: Stack(children: [
            GestureDetector(
                child: Image.asset("assets/topshapeicon.png"),
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
            "View History",
            style: TextStyle(
                color: apptextcolor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.all(10),
            height: 30,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
                border: Border.all(color: apptextcolor),
                borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: " Search by Invoice",
                        hintStyle: TextStyle(fontSize: 12),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: apptextcolor),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.pink),
                  width: 20,
                  child: Icon(
                    Icons.search,
                    color: apptextcolor,
                    size: 20,
                  ),
                )
              ],
            ),
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
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: apptextcolor,
                      border: Border.all(color: apptextcolor)),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Center(
                      child: Text(
                        "Cancelled",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    // width: MediaQuery.of(context).size.width - 80,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "11/03/2021\n11:30 AM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: apptextcolor,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 20,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: apptextcolor,
                      border: Border.all(color: apptextcolor)),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Center(
                      child: Text(
                        "Cancelled",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    // width: MediaQuery.of(context).size.width - 80,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "11/03/2021\n11:30 AM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: apptextcolor,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 20,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: apptextcolor,
                      border: Border.all(color: apptextcolor)),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Center(
                      child: Text(
                        "Cancelled",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    // width: MediaQuery.of(context).size.width - 80,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "11/03/2021\n11:30 AM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: apptextcolor,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 20,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: apptextcolor,
                      border: Border.all(color: apptextcolor)),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Center(
                      child: Text(
                        "Successfull",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    // width: MediaQuery.of(context).size.width - 80,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "11/03/2021\n11:30 AM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: apptextcolor,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 20,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: apptextcolor,
                      border: Border.all(color: apptextcolor)),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Center(
                      child: Text(
                        "Cancelled",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    // width: MediaQuery.of(context).size.width - 80,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "11/03/2021\n11:30 AM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: apptextcolor,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 20,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
      ]))),
    );
  }
}
