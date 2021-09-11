import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../UploadDocumentScreen.dart';

class BookingAppointment extends StatefulWidget {
  static const route = '/BookingAppointment';
  @override
  _BookingAppointmentState createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  List _listitems = ["Father", "Public"];
  String _value;
  Duration initialtimer;
  DateTime date1;
  bool showselect;
  int selected;
  int selected1;
  bool isVisible = false;
  Color selectedBatchColor = apptextcolor;
  bool batchSelected = false;
  bool batch2Selected = false;
  bool batch3Selected = false;
  bool batch4Selected = false;
  bool batch5Selected = false;
  bool batch6Selected = false;

  void initState() {
    selected = null;
    selected1 = null;
    showselect = false;
    date1 = DateTime.now();
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            // contentPadding: EdgeInsets.only(top: 10.0),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: appColorPrimary,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 0.5,
                                offset: Offset.zero,
                                spreadRadius: 0.5)
                          ]),
                      child: Image.asset(
                        "assets/card.png",
                        width: SizeConfig.blockSizeHorizontal * 17,
                        height: SizeConfig.blockSizeVertical * 8,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2),
                          child: Text(
                            "Dr. Ravish Kumar",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: appColorPrimary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: SizeConfig.blockSizeVertical * 2.1,
                                  fontFamily: 'OpenSans'),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2),
                            child: Text("Ayurveda",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.8,
                                      fontFamily: 'OpenSans'),
                                ))),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            content: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0.5,
                      blurRadius: 0.5,
                      color: Colors.grey[200])
                ],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5.0),
              ),
              height: SizeConfig.screenHeight * 0.17,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2),
                      child: Text(
                        "About",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: apptextcolor,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeVertical * 2.1,
                              fontFamily: 'OpenSans'),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 2,
                      right: SizeConfig.blockSizeHorizontal * 2,
                    ),
                    child: Text(
                      "They are frontline and first point of  contact  in a patient's health care They are frontline and first point of  contact  in a patient's health care",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 1.65,
                        fontFamily: 'OpenSans',
                      )),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Read More",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 1.65,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          color: apptextcolor),
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Color radioColor = appColorPrimary;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //////top picture
                Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/topshapeicon.png'),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: AppBar(
                            leading: new IconButton(
                              icon: new Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            backgroundColor: Colors
                                .transparent, //You can make this transparent
                            elevation: 0.0, //No shadow
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Booking Appoinment',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: textSizeLarge,
                            color: apptextcolor,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 2.1),
                      child: Text("Ravish kumar",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: apptextcolor,
                                fontWeight: FontWeight.w800,
                                fontSize: SizeConfig.blockSizeVertical * 2.5,
                                fontFamily: 'OpenSans'),
                          )),
                    ),
                    Container(
                      child: Image(
                        image: AssetImage('assets/batchchat2icon.png'),
                      ),
                      height: SizeConfig.blockSizeVertical * 8,
                      width: SizeConfig.blockSizeHorizontal * 8,
                      padding:
                          EdgeInsets.all(SizeConfig.blockSizeVertical * 0.8),
                      margin:
                          EdgeInsets.all(SizeConfig.blockSizeVertical * 0.8),
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
                Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        )
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "To whom for you booking",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.675,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    activeColor: appColorPrimary,
                                    value: appColorPrimary,
                                    groupValue: radioColor,
                                    onChanged: (val) {
                                      radioColor = val;
                                      setState(() {
                                        isVisible = false;
                                      });
                                    }),
                                Text('Myself',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.35,
                                          fontWeight: FontWeight.w700,
                                          color: apptextcolor,
                                          fontFamily: 'OpenSans'),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    activeColor: appColorPrimary,
                                    // value: Colors.blue,
                                    groupValue: radioColor,
                                    onChanged: (val) {
                                      radioColor = val;
                                      setState(() {
                                        isVisible = true;
                                      });
                                    }),
                                Text(
                                  'Family \n Member',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.35,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.w700,
                                          color: apptextcolor)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isVisible,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 5,
                                  right: SizeConfig.blockSizeHorizontal * 7.66),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text("Select Member",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    2.1),
                                      ))),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 7,
                              width: SizeConfig.screenWidth / 2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      color: Colors.black12)
                                ],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Wrap(children: <Widget>[
                                DropdownButtonHideUnderline(
                                    child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 6.0),
                                  child: DropdownButton(
                                    value: _value,
                                    onChanged: (value) {
                                      print("object");
                                      setState(() {
                                        _value = value;
                                      });
                                    },
                                    elevation: 2,
                                    iconEnabledColor: appColorPrimary,
                                    iconDisabledColor: appColorPrimary,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: appColorPrimary,
                                    ),
                                    isExpanded: true,
                                    items: _listitems.map((value) {
                                      print(value);
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                    hint: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Container(
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/member men icon.png'),
                                              color: Colors.pink,
                                            ),
                                            margin: EdgeInsets.only(
                                                right: SizeConfig
                                                        .blockSizeHorizontal *
                                                    5),
                                          ),
                                          Text(
                                            ("Father"),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.pink,
                                                fontFamily: 'OpenSans'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                              ]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2),
                            height: SizeConfig.blockSizeVertical * 4,
                            child: Image.asset("assets/calender icon.png"),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 26,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2),
                            height: SizeConfig.blockSizeVertical * 4,
                            child: Image.asset("assets/reminder icon.png"),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 26,
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
                                              SizeConfig.blockSizeVertical *
                                                  1.80,
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
                                                SizeConfig.blockSizeVertical *
                                                    1.80,
                                            color: (index == selected1)
                                                ? Colors.white
                                                : appColorPrimary,
                                            fontFamily: 'OpenSans'),
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.blockSizeVertical * 2),
                        child: Text("Select batch",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.blockSizeVertical * 2,
                                  fontFamily: 'OpenSans'),
                            )),
                      ),
                      Container(
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceAround,
                          runSpacing: 10,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  batchSelected = true;
                                  batch2Selected = false;
                                  batch3Selected = false;
                                  batch4Selected = false;
                                  batch5Selected = false;
                                  batch6Selected = false;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                    color: batchSelected == false
                                        ? Colors.white
                                        : selectedBatchColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ]),
                                height: SizeConfig.blockSizeVertical * 4.66,
                                width: SizeConfig.screenWidth / 4.2,
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  "Batch 01",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: batchSelected == false
                                            ? appColorPrimary
                                            : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans',
                                        fontSize: SizeConfig.blockSizeVertical *
                                            1.70),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  batch2Selected = true;
                                  batchSelected = false;
                                  batch3Selected = false;
                                  batch4Selected = false;
                                  batch5Selected = false;
                                  batch6Selected = false;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                    color: batch2Selected == false
                                        ? Colors.white
                                        : selectedBatchColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ]),
                                padding: EdgeInsets.all(5.0),
                                height: SizeConfig.blockSizeVertical * 4.66,
                                width: SizeConfig.screenWidth / 4.5,
                                child: Text(
                                  "Batch 02",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: batch2Selected == false
                                            ? appColorPrimary
                                            : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans',
                                        fontSize: SizeConfig.blockSizeVertical *
                                            1.70),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  batch3Selected = true;
                                  batchSelected = false;
                                  batch2Selected = false;
                                  batch4Selected = false;
                                  batch5Selected = false;
                                  batch6Selected = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: batch3Selected == false
                                        ? Colors.white
                                        : selectedBatchColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ]),
                                padding: EdgeInsets.all(5.0),
                                height: SizeConfig.blockSizeVertical * 4.66,
                                width: SizeConfig.screenWidth / 4.5,
                                child: Text(
                                  "Batch 03",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: batch3Selected == false
                                            ? appColorPrimary
                                            : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans',
                                        fontSize: SizeConfig.blockSizeVertical *
                                            1.70),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  batch4Selected = true;
                                  batchSelected = false;
                                  batch3Selected = false;
                                  batch2Selected = false;
                                  batch5Selected = false;
                                  batch6Selected = false;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                    color: batch4Selected == false
                                        ? Colors.white
                                        : selectedBatchColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ]),
                                padding: EdgeInsets.all(5.0),
                                height: SizeConfig.blockSizeVertical * 4.66,
                                width: SizeConfig.screenWidth / 4.5,
                                child: Text(
                                  "Batch 04",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: batch4Selected == false
                                            ? appColorPrimary
                                            : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans',
                                        fontSize: SizeConfig.blockSizeVertical *
                                            1.70),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  batch5Selected = true;
                                  batchSelected = false;
                                  batch3Selected = false;
                                  batch4Selected = false;
                                  batch2Selected = false;
                                  batch6Selected = false;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                    color: batch5Selected == false
                                        ? Colors.white
                                        : selectedBatchColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ]),
                                padding: EdgeInsets.all(5.0),
                                height: SizeConfig.blockSizeVertical * 4.66,
                                width: SizeConfig.screenWidth / 4.5,
                                child: Text(
                                  "Batch 05",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: batch5Selected == false
                                            ? appColorPrimary
                                            : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans',
                                        fontSize: SizeConfig.blockSizeVertical *
                                            1.70),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  batch6Selected = true;
                                  batchSelected = false;
                                  batch3Selected = false;
                                  batch4Selected = false;
                                  batch5Selected = false;
                                  batch2Selected = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: batch6Selected == false
                                        ? Colors.white
                                        : selectedBatchColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ]),
                                padding: EdgeInsets.all(5.0),
                                height: SizeConfig.blockSizeVertical * 4.66,
                                width: SizeConfig.screenWidth / 4.5,
                                child: Text(
                                  "Batch 06",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: batch6Selected == false
                                            ? appColorPrimary
                                            : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans',
                                        fontSize: SizeConfig.blockSizeVertical *
                                            1.70),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 2,
                              bottom: SizeConfig.blockSizeVertical * 2),
                          child: Text("Doctors in Batch",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.blockSizeVertical * 2,
                                    fontFamily: 'OpenSans'),
                              ))),
                      Wrap(
                        spacing: SizeConfig.blockSizeHorizontal,
                        runSpacing: SizeConfig.blockSizeVertical,
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              createAlertDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                              height: SizeConfig.screenHeight * 0.06,
                              width: SizeConfig.screenWidth * 0.3,
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr.Ravish Kumar",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    " Ayurveda",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.25,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              createAlertDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                              height: SizeConfig.screenHeight * 0.06,
                              width: SizeConfig.screenWidth * 0.3,
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr.Ravish Kumar",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    " Ayurveda",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.25,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              createAlertDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                              height: SizeConfig.screenHeight * 0.06,
                              width: SizeConfig.screenWidth * 0.3,
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr.Ravish Kumar",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    " Ayurveda",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.25,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              createAlertDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                              height: SizeConfig.screenHeight * 0.06,
                              width: SizeConfig.screenWidth * 0.3,
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr.Ravish Kumar",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    " Ayurveda",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.25,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              createAlertDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                              height: SizeConfig.screenHeight * 0.06,
                              width: SizeConfig.screenWidth * 0.3,
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr.Ravish Kumar",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    " Ayurveda",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.25,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              createAlertDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                              height: SizeConfig.screenHeight * 0.06,
                              width: SizeConfig.screenWidth * 0.3,
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr.Ravish Kumar",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.5,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    " Ayurveda",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: apptextcolor,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 1.25,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // SizedBox(
                      //   width: 10,
                      // ),

                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 2,
                      ),
                      MaterialButton(
                        color: appColorPrimary,
                        height: 40,
                        minWidth: SizeConfig.screenWidth - 40,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UploadScreenPage()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeVertical * 2.5,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
