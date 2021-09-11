import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';

class UpdateStatus extends StatefulWidget {
  @override
  _UpdateStatusState createState() => _UpdateStatusState();
}

class _UpdateStatusState extends State<UpdateStatus> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
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
                  "Update Status",
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
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    //width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pain Relief Medicine",
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              Text(
                                "11/03/2021  11:30 AM",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
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
                              width: 10,
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Delivered",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: apptextcolor),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Canceled",
                                  style: TextStyle(fontSize: 10),
                                ),
                                GestureDetector(
                                  child: Container(
                                      height: 20,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: apptextcolor),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                  onTap: () {
                                    showAlertDialog(context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    //width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pain Relief Medicine",
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              Text(
                                "11/03/2021  11:30 AM",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
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
                              width: 10,
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Delivered",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: apptextcolor),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Canceled",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: apptextcolor),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    //width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pain Relief Medicine",
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              Text(
                                "11/03/2021  11:30 AM",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
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
                              width: 10,
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Delivered",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: apptextcolor),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Canceled",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: apptextcolor),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    //width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pain Relief Medicine",
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              Text(
                                "11/03/2021  11:30 AM",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
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
                              width: 10,
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Delivered",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: apptextcolor),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Canceled",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: apptextcolor),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      side: BorderSide(width: 1, color: apptextcolor)),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    //width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pain Relief Medicine",
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              Text(
                                "11/03/2021  11:30 AM",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: apptextcolor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
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
                              width: 10,
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Delivered",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: apptextcolor),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Canceled",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: apptextcolor),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomTabs(2, true),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Reason",
            style: TextStyle(color: apptextcolor, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.wrong_location,
            color: apptextcolor,
          )
        ],
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To: Akshay Malhotra",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Card(
                child: TextField(
                  controller: textController,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: _onChanged,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(apptextcolor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: apptextcolor))))),
              ),
            )
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final textController = TextEditingController();

  int charLength = 0;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
      print(charLength);
    });
  }
}
