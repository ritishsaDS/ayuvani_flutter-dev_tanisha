import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../constant/AppColors.dart';
import '../../../constant/AppConstant.dart';
import '../../../utils/SizeConfig.dart';

class RegimesDoctorAppointmentBooking extends StatefulWidget {
  static final route = '/RegimesDoctorAppointmentBooking';
  @override
  _RegimesDoctorAppointmentBookingState createState() =>
      _RegimesDoctorAppointmentBookingState();
}

class _RegimesDoctorAppointmentBookingState
    extends State<RegimesDoctorAppointmentBooking> {
  Duration initialtimer;
  DateTime date1;
  bool showselect;
  int selected;
  int selected1;
  bool isVisible = false;
  Color selectedBatchColor = apptextcolor;
  bool termsCheckBox;
  bool consultationFeeCheckBox;

  void initState() {
    selected = null;
    selected1 = null;
    showselect = false;
    termsCheckBox = false;
    consultationFeeCheckBox = false;
    date1 = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: SizeConfig.blockSizeHorizontal * 15,
                backgroundImage: NetworkImage(SampleProfileImageUrl),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2.1),
                      child: Text(
                        "Dr. Avinash",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: SizeConfig.blockSizeHorizontal * 4,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2.1),
                      child: Text(
                        "Dentist",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Image(
                    image: AssetImage('assets/batchchat2icon.png'),
                  ),
                  height: SizeConfig.blockSizeVertical * 8,
                  width: SizeConfig.blockSizeHorizontal * 8,
                  padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 0.8),
                  margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 0.8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            offset: Offset.zero,
                            blurRadius: 1)
                      ]),
                )
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: apptextcolor,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.8,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                    Text(
                      LoremText,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2),
                          height: SizeConfig.blockSizeVertical * 4,
                          child: Image.asset("assets/calender icon.png"),
                        ),
                        Container(
                          margin: EdgeInsets.all(
                              SizeConfig.blockSizeHorizontal * 2),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "This Week",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 3,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                        ),
                        Container()
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2,
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 13,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          DateTime date = (DateTime.utc(DateTime.now().year,
                                  DateTime.now().month, DateTime.now().day)
                              .add(Duration(days: index)));
                          String day = date.day.toString();
                          String month = DateFormat.MMM().format(date);
                          String weekDay = DateFormat.E().format(date);
                          return GestureDetector(
                            onTap: () {
                              print("object");
                            },
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selected = index;
                                });
                              },
                              child: Container(
                                height: SizeConfig.blockSizeVertical * 3,
                                padding: EdgeInsets.all(10),
                                width: SizeConfig.blockSizeHorizontal * 14,
                                decoration: BoxDecoration(
                                    color: (index == selected)
                                        ? apptextcolor
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                        bottomLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ]),
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      day.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  2.2,
                                          color: (index == selected)
                                              ? Colors.white
                                              : apptextcolor,
                                          fontFamily: 'OpenSans'),
                                    ),
                                    Text(
                                      weekDay.toString(),
                                      style: TextStyle(
                                          color: (index == selected)
                                              ? Colors.white
                                              : appColorPrimary,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.60,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: 'OpenSans'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 30,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2),
                          height: SizeConfig.blockSizeVertical * 4,
                          child: Image.asset("assets/reminder icon.png"),
                        ),
                        Container(
                          margin: EdgeInsets.all(
                              SizeConfig.blockSizeHorizontal * 2),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Timing",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 3,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                        ),
                        Container()
                      ],
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 7,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          DateTime date = (DateTime.utc(DateTime.now().hour,
                                  DateTime.now().minute, DateTime.now().day)
                              .add(Duration(days: index)));
                          String hour = DateTime.now().hour.toString();
                          String minute = DateTime.now().minute.toString();
                          String weekDay = DateFormat.E().format(date);
                          return GestureDetector(
                            onTap: () {
                              print("object");
                            },
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selected1 = index;
                                });
                              },
                              child: Container(
                                height: SizeConfig.blockSizeVertical * 8,
                                padding: EdgeInsets.all(10),
                                width: SizeConfig.screenWidth / 4.66,
                                decoration: BoxDecoration(
                                    color: (index == selected1)
                                        ? appColorPrimary
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ]),
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      hour.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.80,
                                        fontFamily: 'OpenSans',
                                        color: (index == selected1)
                                            ? Colors.white
                                            : appColorPrimary,
                                      ),
                                    ),
                                    Text(
                                      ':',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.80,
                                        fontFamily: 'OpenSans',
                                        color: (index == selected1)
                                            ? Colors.white
                                            : appColorPrimary,
                                      ),
                                    ),
                                    Text(
                                      minute.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.80,
                                          color: (index == selected1)
                                              ? Colors.white
                                              : appColorPrimary,
                                          fontFamily: 'OpenSans'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 30,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: termsCheckBox,
                          activeColor: appColorPrimary,
                          onChanged: (value) {
                            setState(() {
                              termsCheckBox = value;
                            });
                          },
                        ),
                        const Text('I agree'),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'terms & conditions',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: apptextcolor, fontFamily: 'OpenSans'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Checkbox(
                  value: consultationFeeCheckBox,
                  activeColor: appColorPrimary,
                  onChanged: (value) {
                    setState(() {
                      consultationFeeCheckBox = value;
                    });
                  },
                ),
                const Text('Virtual Care Consultation'),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  '\$50',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: apptextcolor,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20.0, right: 10.0, left: 10.0),
              child: Center(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minWidth: SizeConfig.screenWidth,
                  color: appColorPrimary,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Payment');
                  },
                  child: Text(
                    'Book Appointment',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: textSizeLargeMedium,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
