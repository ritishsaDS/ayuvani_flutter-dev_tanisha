import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/ui/user/HomePageScreen.dart';
import 'package:flutter_ayuvani/ui/user/UserProfile.dart';

class BottomTabs extends StatefulWidget {
  int index;
  bool showCat;
  BottomTabs(this.index, this.showCat);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  Timer timer;

  int countCart = 0;

  int count = 0;

  var badgecart;

  String intValue;

  /*void startTimer() {
    timer = new Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        countCart = 0;
        for (var pro in cartTemporary) {
          countCart = countCart + pro['quantity'];
          //print(pro['quantity']);
        }
      });
    });
  }*/
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
      height: 50,
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
                          Navigator.popUntil(
                              context, ModalRoute.withName(HomePage.route));
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
                                      : Colors.grey,
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
                            Navigator.popUntil(context,
                                ModalRoute.withName(UserProfile.route));
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
                                  Icons.shop_outlined,
                                  size: 25,
                                  color: widget.index == 2
                                      ? apptextcolor
                                      : Colors.grey,
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
                        if (widget.index == 3) {
                          return;
                        }
                        if (intValue == null) {
                        } else {}
                      },
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Icon(
                              Icons.person_outline,
                              size: 25,
                              color: widget.index == 3
                                  ? apptextcolor
                                  : Colors.grey,
                            ),
                            SizedBox(height: 2)
                          ])),
                    ), //Icon(Icons.shopping_cart,color:  widget.index == 5 ? primaryColor : Colors.grey,),

                    // Icon(Icons.shopping_cart, color:  index == 4 ? primaryColor : Colors.grey,),
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
