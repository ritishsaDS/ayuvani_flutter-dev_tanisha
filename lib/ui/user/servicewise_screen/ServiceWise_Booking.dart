import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../constant/AppColors.dart';
import '../../../constant/AppConstant.dart';
import '../../../utils/SizeConfig.dart';

class SeviceWiseBooking extends StatefulWidget {
  static final route = '/SeviceWiseBooking';
  @override
  _SeviceWiseBookingState createState() => _SeviceWiseBookingState();
}

class _SeviceWiseBookingState extends State<SeviceWiseBooking> {
  Duration initialtimer;
  DateTime date1;
  bool showselect;
  int selected;
  int selected1;
  bool isVisible = false;
  Color selectedBatchColor = apptextcolor;
  bool termsCheckBox;
  bool consultationFeeCheckBox;

  final getAssets = ['green', 'blue', 'purple', 'orange', 'pink', 'peach'];

  void initState() {
    selected = null;
    selected1 = null;
    showselect = false;
    termsCheckBox = false;
    consultationFeeCheckBox = false;
    date1 = DateTime.now();
  }

  final colorServiceWise = [
    ayurvadicGreen,
    yogaBlue,
    unaniPurple,
    siddhaOrange,
    sowaPink,
    homeopathyPeach
  ];

  @override
  Widget build(BuildContext context) {
    int indexColor = ModalRoute.of(context).settings.arguments;

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
                radius: 70,
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
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
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
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Image(
                    image: AssetImage(
                        'assets/message icon (${getAssets[indexColor]}).png'),
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
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Image.asset('assets/experience icon (${getAssets[]}).png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2.1),
                            child: Column(
                              children: [
                                Text(
                                  "Experience",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.5,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2.1),
                            child: Text(
                              "5 Year",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: colorServiceWise[indexColor],
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.5,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2.1),
                        child: Column(
                          children: [
                            Text(
                              "Rating",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.5,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //todo:need to ask about rating bar or need to show number
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2.1),
                        child: Text(
                          "5",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: colorServiceWise[indexColor],
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeVertical * 2.5,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2.1),
                        child: Column(
                          children: [
                            Text(
                              "Science",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.5,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 2.1),
                        child: Text(
                          "Ayurveda",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: colorServiceWise[indexColor],
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.blockSizeVertical * 2.5,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
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
                            color: colorServiceWise[indexColor],
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.5,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                    Text(
                      LoremText,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2),
                            height: SizeConfig.blockSizeVertical * 4,
                            child: Icon(
                              Icons.calendar_today,
                              color: colorServiceWise[indexColor],
                            )
                            // Image.asset("assets/calender icon.png"),
                            ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 24,
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
                                    color: colorServiceWise[indexColor],
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.1,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                        ),
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
                                        ? colorServiceWise[indexColor]
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
                                              : colorServiceWise[indexColor],
                                          fontFamily: 'OpenSans'),
                                    ),
                                    Text(
                                      weekDay.toString(),
                                      style: TextStyle(
                                          color: (index == selected)
                                              ? Colors.white
                                              : colorServiceWise[indexColor],
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2),
                          height: SizeConfig.blockSizeVertical * 4,
                          child: Icon(Icons.alarm,
                              color: colorServiceWise[indexColor]),
                          // Image.asset("assets/watch .png")
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 24,
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
                                    color: colorServiceWise[indexColor],
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.1,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                        ),
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
                                        ? colorServiceWise[indexColor]
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
                                            : colorServiceWise[indexColor],
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
                                              : colorServiceWise[indexColor],
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
                          activeColor: colorServiceWise[indexColor],
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
                                  color: colorServiceWise[indexColor],
                                  fontFamily: 'OpenSans'),
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
                  activeColor: colorServiceWise[indexColor],
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
                        color: colorServiceWise[indexColor],
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
                  color: colorServiceWise[indexColor],
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
