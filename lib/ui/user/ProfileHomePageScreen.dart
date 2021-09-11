import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/ui/user/reminder_screen.dart';
import 'package:flutter_ayuvani/ui/user/servicewise_screen/ServiceWise.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/SizeConfig.dart';
import 'add_members/add_family_list.dart';
import 'blog/blog_screen.dart';
import 'book_appoitment/Booking_Appointment.dart';
import 'buy_medicine/Buy_Medicine.dart';
import 'chat_screens/ChatListScreen.dart';
import 'login/bloc/user_login_bloc.dart';
import 'regimes_packages/Regimes_Products_List.dart';

class ProfileHomePage extends StatefulWidget {
  static const route = "/ProfileHomePageMain";
  @override
  _ProfileHomePageState createState() => _ProfileHomePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _ProfileHomePageState extends State<ProfileHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isForwarded = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    // Timer(Duration(milliseconds: 200), () =>
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isForwarded = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isForwarded = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileData = context.watch<UserLoginBloc>().chemistLoginModel;
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appColorPrimary,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white38,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: SizeConfig.blockSizeHorizontal * 5,
              backgroundImage: AssetImage("assets/google.png"),
            ),
            Icon(
              Icons.keyboard_arrow_down,
            ),
            Text(
              'Punjab',
              style: TextStyle(color: appColorPrimary),
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: SizeConfig.screenWidth * 0.02),
            child: ImageIcon(
              AssetImage('assets/bell.png'),
              size: SizeConfig.blockSizeVertical * 3.75,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2.4,
                    left: SizeConfig.blockSizeHorizontal * 6.75),
                child: Text(
                  "Wednesday, 10 March",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeVertical * 1.9,
                          color: apptextcolor)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 0.75,
                    left: SizeConfig.blockSizeHorizontal * 6.75),
                child: Text(
                  "Hi, ${userProfileData.data.name}",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeVertical * 2.4,
                    color: apptextcolor,
                  )),
                ),
              ),
              Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: SizeConfig.blockSizeVertical * 6.75,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 5.25),
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 4.5,
                      vertical: SizeConfig.blockSizeVertical * 2),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tile.png'),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImageIcon(
                        AssetImage(
                          'assets/calender icon.png',
                        ),
                        color: Colors.white,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2.80),
                        child: Row(
                          children: [
                            Text(
                              "Meet Dr. Ekam Mathew",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeVertical * 1.95,
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                              )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 1.70),
                        child: Text(
                          //ToDo: Make the date dynamic
                          "14:30 PM",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.blockSizeVertical * 1.90,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans')),
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: SizeConfig.blockSizeVertical * 6.75,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 5.25),
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 4.5,
                      vertical: SizeConfig.blockSizeVertical * 0.01),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tile.png'),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ChatListScreen.route);
                          },
                          child: Row(
                            children: [
                              ImageIcon(
                                AssetImage('assets/chat icon.png'),
                                color: Colors.white,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        SizeConfig.blockSizeHorizontal * 1.75),
                                child: Text(
                                  "Chat",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          color: Colors.white,
                                          fontFamily: 'OpenSans')),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                child: Icon(
                              Icons.question_answer,
                              color: Colors.white,
                            )),
                            Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 1.75),
                              child: Text(
                                "FAQs",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: Colors.white,
                                        fontFamily: 'OpenSans')),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, ProfileHomePage.route);
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                    child: ImageIcon(
                                  AssetImage('assets/profile.png'),
                                  color: Colors.white,
                                )),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal *
                                          1.75),
                                  child: Text(
                                    "Profile",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    2,
                                            color: Colors.white,
                                            fontFamily: 'OpenSans')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                width: SizeConfig.blockSizeHorizontal * 100,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
                child: Text(
                  "My Feed",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.blockSizeVertical * 2.25,
                          color: Colors.black,
                          fontFamily: 'OpenSans')),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 4.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, BlogScreen.route);
                        },
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 42,
                          height: SizeConfig.blockSizeVertical * 8,
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 3),
                          margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 2),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),
                              ]),
                          child: Row(
                            children: [
                              Container(
                                  child: ImageIcon(
                                AssetImage('assets/blog icon.png'),
                                color: apptextcolor,
                              )),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 2.0),
                                child: Text(
                                  "Blog",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.8,
                                          color: apptextcolor,
                                          fontFamily: 'OpenSans')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AddFamilyList.route);
                        },
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 42,
                          height: SizeConfig.blockSizeVertical * 8,
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 3),
                          margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 2),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),
                              ]),
                          child: Row(
                            children: [
                              Container(
                                  child: ImageIcon(
                                AssetImage('assets/phonebook icon.png'),
                                color: apptextcolor,
                              )),
                              Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 1.1),
                                child: Text(
                                  "Add Family\nMember",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.85,
                                          color: apptextcolor,
                                          fontFamily: 'OpenSans')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 4.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //todo: add health record screen
                        },
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 42,
                          height: SizeConfig.blockSizeVertical * 8,
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 3),
                          margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 0.1),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),
                              ]),
                          child: Row(
                            children: [
                              Container(
                                  child: ImageIcon(
                                AssetImage('assets/health.png'),
                                color: apptextcolor,
                              )),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    left:
                                        SizeConfig.blockSizeHorizontal * 1.50),
                                child: Text(
                                  "Health Record",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.85,
                                          color: apptextcolor,
                                          fontFamily: 'OpenSans')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ReminderScreen.route);
                        },
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 42,
                          height: SizeConfig.blockSizeVertical * 8,
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 3),
                          margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 0.1),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),
                              ]),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/reminder icon.png',
                                height: SizeConfig.blockSizeHorizontal * 5,
                                width: SizeConfig.blockSizeHorizontal * 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        SizeConfig.blockSizeHorizontal * 1.50),
                                child: Text(
                                  "Reminders",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.80,
                                          color: apptextcolor,
                                          fontFamily: 'OpenSans')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              //-------------------------need to change here
              Container(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 3),
                margin: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 2.5,
                    right: SizeConfig.blockSizeHorizontal * 2.5,
                    top: SizeConfig.blockSizeVertical * 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ]),
                child: Column(
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1),
                      child: Text(
                        "What are you looking for?",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConfig.blockSizeVertical * 2.25,
                                color: Colors.black,
                                fontFamily: 'OpenSans')),
                      ),
                    ),

                    //-----------------------------------------------------------
                    SlideTransition(
                      position:
                          Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                              .animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeOut)),
                      child: Wrap(
                        children: [
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal * 4.5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookingAppointment()));
                                        },
                                        child: Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  42,
                                          height:
                                              SizeConfig.blockSizeVertical * 8,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.0)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 5.0,
                                                  spreadRadius: 2.0,
                                                ),
                                              ]),
                                          child: Row(
                                            children: [
                                              Container(
                                                  child: ImageIcon(
                                                AssetImage(
                                                    'assets/booking app. icon.png'),
                                                color: apptextcolor,
                                              )),
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    left: SizeConfig
                                                            .blockSizeHorizontal *
                                                        1.5),
                                                child: Text(
                                                  "Booking\nAppointment",
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.8,
                                                          color: apptextcolor,
                                                          fontFamily:
                                                              'OpenSans')),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, BuyMedicine.route);
                                        },
                                        child: Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  42,
                                          height:
                                              SizeConfig.blockSizeVertical * 8,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.0)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 5.0,
                                                  spreadRadius: 2.0,
                                                ),
                                              ]),
                                          child: Row(
                                            children: [
                                              Container(
                                                  child: ImageIcon(
                                                AssetImage(
                                                    'assets/buy medicine icon.png'),
                                                color: apptextcolor,
                                              )),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: SizeConfig
                                                            .blockSizeHorizontal *
                                                        1.1),
                                                child: Text(
                                                  "Buy Medicine",
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.85,
                                                          color: apptextcolor,
                                                          fontFamily:
                                                              'OpenSans')),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal * 4.5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              RegimesProductList.route);
                                        },
                                        child: Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  42,
                                          height:
                                              SizeConfig.blockSizeVertical * 8,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      0.1),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.0)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 5.0,
                                                  spreadRadius: 2.0,
                                                ),
                                              ]),
                                          child: Row(
                                            children: [
                                              Container(
                                                  child: ImageIcon(
                                                AssetImage(
                                                    'assets/regimes icon.png'),
                                                color: apptextcolor,
                                              )),
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    left: SizeConfig
                                                            .blockSizeHorizontal *
                                                        1.50),
                                                child: Text(
                                                  "Regimes",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.85,
                                                          color: apptextcolor,
                                                          fontFamily:
                                                              'OpenSans')),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, ServiceWise.route);
                                        },
                                        child: Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  42,
                                          height:
                                              SizeConfig.blockSizeVertical * 8,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3),
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.blockSizeVertical *
                                                      0.1),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6.0)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 5.0,
                                                  spreadRadius: 2.0,
                                                ),
                                              ]),
                                          child: Row(
                                            children: [
                                              Container(
                                                  child: Icon(
                                                Icons.content_copy,
                                                size: SizeConfig
                                                        .blockSizeHorizontal *
                                                    5,
                                                color: apptextcolor,
                                              )),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: SizeConfig
                                                            .blockSizeHorizontal *
                                                        1.50),
                                                child: Text(
                                                  "Service Wise",
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: SizeConfig
                                                                  .blockSizeVertical *
                                                              1.80,
                                                          color: apptextcolor,
                                                          fontFamily:
                                                              'OpenSans')),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          // IconButton(
                          //     icon: Icon(
                          //       Icons.arrow_forward_ios,
                          //       size: 10,
                          //     ),
                          //     onPressed: () {
                          //       isForwarded
                          //           ? _animationController.forward()
                          //           : _animationController.reverse();
                          //     })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: SizeConfig.screenHeight * 0.03,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushNamed(context, BlogScreen.route);
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(
              //         left: SizeConfig.blockSizeHorizontal * 2,
              //         right: SizeConfig.blockSizeHorizontal * 2),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.all(Radius.circular(6.0)),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black12,
              //             blurRadius: 5.0,
              //             spreadRadius: 2.0,
              //           ),
              //         ]),
              //     height: SizeConfig.screenHeight * 0.12,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Container(
              //           width: SizeConfig.blockSizeHorizontal * 6,
              //           padding: EdgeInsets.symmetric(
              //               vertical: SizeConfig.blockSizeVertical * 0.3),
              //           decoration: BoxDecoration(
              //             color: Colors.pink[300],
              //             borderRadius: BorderRadius.all(Radius.circular(6.0)),
              //           ),
              //           child: Align(
              //             alignment: Alignment.center,
              //             child: RotatedBox(
              //               quarterTurns: -1,
              //               child: Text(
              //                 "Blog",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold,
              //                     fontFamily: 'OpenSans',
              //                     fontSize:
              //                         SizeConfig.blockSizeVertical * 1.75),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           width: SizeConfig.screenWidth * 0.85,
              //           margin: EdgeInsets.all(SizeConfig.screenWidth * 0.02),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text("Title",
              //                   style: TextStyle(
              //                       color: apptextcolor,
              //                       fontSize:
              //                           SizeConfig.blockSizeVertical * 1.80,
              //                       fontWeight: FontWeight.bold,
              //                       fontFamily: 'OpenSans')),
              //               Container(
              //                 child: Text(
              //                   "Lorem ipsum dolor sit amet, consectetur elit sed do eiusmod tempor incididunt ut in reprehenderit in   cillum dolore .",
              //                   textAlign: TextAlign.justify,
              //
              //                   // overflow: TextOverflow.fade,
              //                   style: TextStyle(
              //                       color: apptextcolor,
              //                       fontSize:
              //                           SizeConfig.blockSizeVertical * 1.70,
              //                       fontFamily: 'OpenSans'),
              //                 ),
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    ));
  }

  gridViewForYourSection({
    @required String route,
    @required String title,
    @required String iconAssets,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 42,
        height: SizeConfig.blockSizeVertical * 8,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3),
        margin:
            EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 0.1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ]),
        child: Row(
          children: [
            Container(
                child: Icon(
              Icons.content_copy,
              size: SizeConfig.blockSizeHorizontal * 5,
              color: apptextcolor,
            )),
            Container(
              margin:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 1.50),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.blockSizeVertical * 1.80,
                        color: apptextcolor,
                        fontFamily: 'OpenSans')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
