import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ReminderScreen extends StatefulWidget {
  static const route = '/ReminderScreen';

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  int selected;
  DateTime date1;

  void initState() {
    selected = null;
    date1 = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                        size: 35,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    backgroundColor:
                        Colors.transparent, //You can make this transparent
                    elevation: 0.0, //No shadow
                  ),
                ),
              ],
            ),
            Text(
              'Reminders',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: textSizeLarge,
                    color: apptextcolor,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
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
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Column(
                          children: <Widget>[
                            Text(
                              day.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.blockSizeVertical * 2.2,
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
                                  fontSize: SizeConfig.blockSizeVertical * 1.60,
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
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return reminderCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  reminderCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  SampleProfileImageUrl,
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Meet Dr. Ekam Mathew'),
              Text('14:30 PM'),
              Row(
                children: [
                  Image.asset(
                    'assets/batchchat2icon.png',
                    height: 25,
                    width: 25,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.videocam,
                        color: appColorPrimary,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.call, color: appColorPrimary),
                      onPressed: () {}),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
