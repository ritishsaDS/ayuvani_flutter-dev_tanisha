import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';

class OrderStatus extends StatefulWidget {
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
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
          "Orders Status",
          style: TextStyle(
              color: apptextcolor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: apptextcolor,
          ),
          child: Card(
            elevation: 4,
            child: ExpandablePanel(
              header: Container(
                padding: EdgeInsets.all(5),
                // margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.car_rental,
                      color: apptextcolor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    Center(
                      child: Text(
                        "Pain Relief Funds".toString().replaceAll("&amp;", "&"),
                        style: TextStyle(
                            fontSize: 16,
                            color: apptextcolor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              expanded: Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Container(
                  child: Column(children: [
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
                            "Origin\nDelhi",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Destination\nPunjab",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Estimated Delivery Date"),
                          Text("31 March")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
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
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: apptextcolor,
          ),
          child: Card(
            elevation: 4,
            child: ExpandablePanel(
              header: Container(
                padding: EdgeInsets.all(5),
                // margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.car_rental,
                      color: apptextcolor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    Center(
                      child: Text(
                        "Pain Relief Funds".toString().replaceAll("&amp;", "&"),
                        style: TextStyle(
                            fontSize: 16,
                            color: apptextcolor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              expanded: Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Container(
                  child: Column(children: [
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
                            "Origin\nDelhi",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Destination\nPunjab",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Estimated Delivery Date"),
                          Text("31 March")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
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
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: apptextcolor,
          ),
          child: Card(
            elevation: 4,
            child: ExpandablePanel(
              header: Container(
                padding: EdgeInsets.all(5),
                // margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.car_repair,
                      color: apptextcolor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    Center(
                      child: Text(
                        "Pain Relief Funds".toString().replaceAll("&amp;", "&"),
                        style: TextStyle(
                            fontSize: 16,
                            color: apptextcolor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              expanded: Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Container(
                  child: Column(children: [
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
                            "Origin\nDelhi",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Destination\nPunjab",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Estimated Delivery Date"),
                          Text("31 March")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "11:30 AM",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                          Text(
                            "Recieved",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                "27 March",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("11:30 AM"),
                            ],
                          ),
                        ],
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
      )
    ]))));
  }
}
