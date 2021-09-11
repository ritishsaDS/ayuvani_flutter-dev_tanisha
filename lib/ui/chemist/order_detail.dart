import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';

class OrderDetail extends StatefulWidget {
  static const route = '/OrderDetail';
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
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
                  Image.asset("assets/topshapeicon.png"),
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
                child: Text(
                  "Cough And Cold Medicine ",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 80,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tablets IP 200 mg",
                                style: TextStyle(
                                    color: appTextColorPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Ayurvedic Medicine",
                                style: TextStyle(
                                    color: appTextColorPrimary, fontSize: 10),
                              )
                            ],
                          ),
                          Text(
                            "Qty\n5",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: appTextColorSecondary, fontSize: 12),
                          )
                        ]),
                  ),
                ),
              ),
              ExpandableTheme(
                data: const ExpandableThemeData(
                  iconColor: Colors.white,
                ),
                child: Card(
                  child: ExpandablePanel(
                    header: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: apptextcolor),
                          borderRadius: BorderRadius.circular(8.0),
                          color: apptextcolor),
                      padding: EdgeInsets.all(5),
                      // margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Ready to Deliver"
                                  .toString()
                                  .replaceAll("&amp;", "&"),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    expanded: Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 0, right: 0, top: 5),
                      child: Container(
                        child: Column(children: [
                          Center(
                            child: Text(
                              "Update Tracking Number",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                              height: 50,
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 10),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: apptextcolor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: apptextcolor,
                                  ),
                                ),
                              ))),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Update",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              apptextcolor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                  color: apptextcolor))))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
