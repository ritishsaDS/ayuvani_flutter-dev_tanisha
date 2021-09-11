import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';

import 'chemist_dashboard/chemist_dashboard_screen.dart';
import 'chemist_profile/chemistProfile.dart';
import 'history_detail.dart';

class ChemistBottomNav extends StatefulWidget {
  int index;
  bool showCat;
  ChemistBottomNav(this.index, this.showCat);

  @override
  _ChemistBottomNavState createState() => _ChemistBottomNavState();
}

class _ChemistBottomNavState extends State<ChemistBottomNav> {
  Timer timer;

  int countCart = 0;

  int count = 0;

  var badgecart;

  String intValue;

  void startTimer() {
    timer = new Timer.periodic(Duration(seconds: 2), (timer) {
//getcartcount();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    // getuser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/tile.png"),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Wrap(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    // color: transparentBlack,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Align(
            child: Container(
              alignment: Alignment.topCenter,
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/tile.png"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          //Navigator.popUntil(context, StoreDetail(null));
                          if (widget.index == 1) {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            // return;
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChemistDashboardScreen(),
                                ));
                          }
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 60,
                                decoration: widget.index == 1
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.white)
                                    : null,
                                child: Icon(
                                  Icons.shop_outlined,
                                  size: 25,
                                  color: widget.index == 1
                                      ? apptextcolor
                                      : Colors.white,
                                ),
                              ),
                              Text("Home",
                                  style: TextStyle(
                                      color: apptextcolor, fontSize: 12)),
                              SizedBox(height: 2)
                            ])),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          //Navigator.popUntil(context, StoreDetail(null));
                          if (widget.index == 2) {
                            // return;
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryDetail(),
                                ));
                          }
                          // Navigator.popUntil(context, ModalRoute.withName('/store'));
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 60,
                                decoration: widget.index == 2
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.white)
                                    : null,
                                child: Icon(
                                  Icons.receipt_long,
                                  size: 25,
                                  color: widget.index == 2
                                      ? apptextcolor
                                      : Colors.white,
                                ),
                              ),
                              Text("Wishlist",
                                  style: TextStyle(
                                      color: apptextcolor, fontSize: 12)),
                              SizedBox(height: 2)
                            ])),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          //Navigator.popUntil(context, StoreDetail(null));
                          if (widget.index == 3) {
                            // return;
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChemistProfile(),
                                ));
                          }
                          // Navigator.popUntil(context, ModalRoute.withName('/store'));
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 60,
                                decoration: widget.index == 3
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.white)
                                    : null,
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 25,
                                  color: widget.index == 3
                                      ? apptextcolor
                                      : Colors.white,
                                ),
                              ),
                              Text("Profile",
                                  style: TextStyle(
                                      color: apptextcolor, fontSize: 12)),
                              SizedBox(height: 2)
                            ])),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
