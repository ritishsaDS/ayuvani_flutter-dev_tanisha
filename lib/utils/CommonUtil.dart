import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/utils/AppWidget.dart';
import 'package:google_place/google_place.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:intl/intl.dart';
import 'package:store_redirect/store_redirect.dart';

import '../main.dart';
import 'Dialogs.dart';
import 'SizeConfig.dart';

List<AutocompletePrediction> predictions = [];
GooglePlace googlePlace;
final GlobalKey<State> logoutloader = new GlobalKey<State>();
Future<List<dynamic>> loadDataFromJson(BuildContext context) async {
  final fakeData = await DefaultAssetBundle.of(context)
      .loadString('assets/integrations/map_point.json');
  return json.decode(fakeData.toString());
}

String intToHex(int i) {
  var s = i.toRadixString(16);
  if (s.length == 8) {
    return '#' + s.substring(2).toUpperCase();
  } else {
    return '#' + s.toUpperCase();
  }
}

Widget networkImage(String image,
    {String aPlaceholder = "images/integrations/img/placeholder.png",
    double aWidth,
    double aHeight,
    var fit = BoxFit.fill}) {
  return image != null && image.isNotEmpty
      ? FadeInImage(
          placeholder: AssetImage(aPlaceholder),
          image: NetworkImage(image),
          width: aWidth != null ? aWidth : null,
          height: aHeight != null ? aHeight : null,
          fit: fit,
        )
      : Image.asset(
          aPlaceholder,
          width: aWidth,
          height: aHeight,
          fit: BoxFit.fill,
        );
}

Widget loadingWidgetMaker() {
  return Container(
    alignment: Alignment.center,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 4,
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: Container(
        width: 45,
        height: 45,
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
    ),
  );
}

showAlertDialog(BuildContext context, String message, String type,
    {double rate, bool isfeedback, String submitfeedback,String foldtype}) {
  // set up the buttons
  // set up the buttons;

  // set up the AlertDialog
  print(type);
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
    contentPadding: EdgeInsets.zero,
    content: Container(
      height: 250,
      width: 50,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
          child: Container(
            height: 60,
            padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 4.0),
            color: apptextcolor,
            child: Center(
                child: Image.asset("assets/popup_info.png",
                    height: 30, width: 30)),
          ),
        ),
        Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    message == "Token is not valid"
                        ? "Your Session is expired.Please Login again"
                        : message
                    /* "Your Session is expired.Please Login again"*/,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            )),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
            Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 10),
            child: Material(
              color: apptextcolor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(8.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  if(type=="Register")
                    {
                      finish(context);
                    }
                },
                /*   onTap: () async {
                      try {
                        final result =
                        await InternetAddress.lookup(
                            'google.com');
                        if (result.isNotEmpty &&
                            result[0].rawAddress.isNotEmpty) {
                          SharedPreferencesTest()
                              .checkIsLogin("2");
                          Navigator.of(context)
                              .pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DTSignInScreen()),
                                  (Route<dynamic> route) =>
                              false);
                        }
                      } on SocketException catch (_) {
                        Fluttertoast.showToast(
                            msg: "No Internet Connection",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },*/
                child: Container(
                  height: 35,
                  width: 80,
                  padding: EdgeInsets.only(top: 13),
                  child: Text(
                    message == "Token" ? "LOGOUT" : "OK",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ]),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(onWillPop: () async => false, child: alert);
    },
  );
}

showfeedback(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      elevation: 0.0,
      isScrollControlled: true,
      backgroundColor: appStore.scaffoldBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      builder: (builder) {
        return SizedBox();
        /*FeedbackScreen();*/
      }).then((value) {});
}

Widget getItem({String name, Icon icon, Function ontap}) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(width: 16),
                icon,
                SizedBox(width: 16),
                text(name, textColor: appStore.textPrimaryColor)
              ],
            ),
          ),
          IconButton(
            onPressed: ontap,
            icon: Icon(Icons.keyboard_arrow_right),
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Divider(),
      )
    ],
  );
}

Widget getToggleButton(
    {String name, Icon icon, Function onChanged, bool val, double scale}) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(width: 16),
                icon,
                SizedBox(width: 16),
                text(name, textColor: appStore.textPrimaryColor)
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 5),
              child: Transform.scale(
                scale: scale,
                child: CupertinoSwitch(
                    activeColor: appColorPrimary,
                    value: val,
                    onChanged: onChanged),
              ))
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Divider(),
      )
    ],
  );
}

KeyboardActionsConfig buildConfig(BuildContext context, FocusNode node) {
  return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: appColorPrimary,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          displayArrows: false,
          focusNode: node,
        )
      ]);
}

showlocationDialog(BuildContext context, String type) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            /* width: SizeConfig.blockSizeHorizontal * 88,
              height: SizeConfig.blockSizeVertical * 65,*/
            color: Colors.white,
            child: MyDialogContent(
              type: type,
            ),
          ),
        );
      });
}

Future<String> dateBottomSheet(context) async {
  var now = DateTime.now();
  var today = DateTime(now.year - 50, now.month, now.day);
  String date;
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext e) {
        return Container(
          height: 245,
          child: Column(
            children: [
              Container(
                color: appStore.appBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cancel',
                      style: boldTextStyle(),
                    ).onTap(() {
                      finish(context);
                    }),
                    Text(
                      'Done',
                      style: boldTextStyle(),
                    ).onTap(() {
                      finish(context, date);
                    })
                  ],
                ).paddingOnly(top: 8, left: 8, right: 8, bottom: 8),
              ),
              Container(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: primaryTextStyle(size: 20))),
                  child: CupertinoDatePicker(
                    backgroundColor: appStore.appBarColor,
                    minimumDate: today,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (var dateTime) {
                      var dateFormat = new DateFormat('MM/dd/yyyy');
                      String formattedDate = dateFormat.format(dateTime);
                      print(formattedDate);
                      date = formattedDate;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      });
  return date;
}

class MyDialogContent extends StatefulWidget {
  final String type;
  MyDialogContent({Key key, this.type}) : super(key: key);

  @override
  _MyDialogContentState createState() => new _MyDialogContentState();
}

class _MyDialogContentState extends State<MyDialogContent> {
  int _selectedIndex = 0;

  @override
  void initState() {
    googlePlace = GooglePlace("AIzaSyD1iiQGTD-9O7JJyPfMEQTLgWwEX9rR4rg");
    predictions.clear();
    super.initState();
  }

  _getContent() {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            appBar(context, '',
                showBack: true,
                size: (SizeConfig.blockSizeVertical * 2.25).toInt(),
                iconColor: white,
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: SizeConfig.blockSizeHorizontal * 89,
                    child: TextFormField(
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: "Search Address",
                        focusColor: appColorPrimaryDark,
                        contentPadding: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 3),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: appTextColorSecondary,
                            width: 1.5,
                          ),
                        ),
                        //prefixIcon: Icon(Icons.arrow_back_ios_rounded),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: appTextColorSecondary,
                            width: 1.25,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            autoCompleteSearch(value);
                          });
                        } else {
                          if (predictions.length > 0 && mounted) {
                            setState(() {
                              predictions = [];
                            });
                          }
                        }
                      },
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            autoCompleteSearch(value);
                          });
                        } else {
                          if (predictions.length > 0 && mounted) {
                            setState(() {
                              predictions = [];
                            });
                          }
                        }
                      },
                    ),
                  )
                ]),
            Expanded(
              child: ListView.builder(
                itemCount: predictions.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(predictions[index].description),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);

                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }
}
