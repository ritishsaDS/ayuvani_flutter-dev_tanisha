import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyMedicinePicing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/topshapeicon.png',
                    height: 90,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: AppBar(
                      leading: BackButton(
                        color: Colors.white,
                      ),
                      backgroundColor:
                          Colors.transparent, //You can make this transparent
                      elevation: 0.0, //No shadow
                    ),
                  ),
                ],
              ),
              Text(
                'Buy Medicine',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: textSizeLarge,
                      color: apptextcolor,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                children: [
                  DefaultTabController(
                    length: 3, // length of tabs
                    initialIndex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: apptextcolor,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(
                                text: 'Homeopathy',
                              ),
                              Tab(text: 'Allopathy'),
                              Tab(text: 'Ayurvadic'),
                            ],
                          ),
                        ),
                        Container(
                          height: 500, //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(
                            children: <Widget>[
                              homeopathy(),
                              allopathy(),
                              ayurvadic(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomPricing());
  }

  bottomPricing() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: appColorPrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Now',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 180,
              height: 60,
              decoration: BoxDecoration(
                color: appLayout_background,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                          color: apptextcolor,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    '\$1000',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 5,
                          color: apptextcolor,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ayurvadic() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 50),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Card(
                      elevation: 3,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tablets IP 200mg',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  'Ayurvadic',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 3.5),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      bottom: -35,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        child: Text(
                          '\$100',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4,
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: appColorPrimary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  allopathy() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 50),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Card(
                      elevation: 3,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tablets IP 200mg',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  'Ayurvadic',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 3.5),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      bottom: -35,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        child: Text(
                          '\$100',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4,
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: appColorPrimary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  homeopathy() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 50),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Card(
                      elevation: 3,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tablets IP 200mg',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  'Ayurvadic',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 3.5),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      bottom: -35,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        child: Text(
                          '\$100',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4,
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: appColorPrimary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
