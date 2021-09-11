import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';

import 'payment/Payment.dart';

class UploadScreenPage extends StatefulWidget {
  static const route = '/UploadScreenPage';
  @override
  _UploadScreenPageState createState() => _UploadScreenPageState();
}

class _UploadScreenPageState extends State<UploadScreenPage> {
  TextEditingController _textEditingController = TextEditingController();
  bool _rememberMeFlag = false;
  bool _rememberMeFlag2 = false;
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
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.1,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/topshapeicon.png',
                          ),
                          fit: BoxFit.fill)),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    radius: SizeConfig.blockSizeVertical * 8,
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/google.png'),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                  width: SizeConfig.screenWidth * 0.95,
                  padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 0.1,
                      right: SizeConfig.blockSizeHorizontal * 0.1,
                      top: SizeConfig.blockSizeVertical * 0.1,
                      bottom: SizeConfig.blockSizeVertical * 0.1),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        color: Colors.grey[200],
                        blurRadius: 1,
                        offset: Offset.zero)
                  ]),
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                        child: Text(
                          "Upload Document",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'OpenSans'),
                        ),
                        color: apptextcolor,
                      ),
                      Container(
                        width: SizeConfig.screenWidth * 0.95,
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 2),
                        child: Wrap(
                          alignment: WrapAlignment.spaceAround,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical * 4,
                              width: SizeConfig.screenWidth * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey[200],
                                        offset: Offset.zero)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Medical Report.pdf",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'OpenSans',
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.25),
                                    ),
                                    Icon(
                                      Icons.close,
                                      size: 15,
                                      color: appColorPrimary,
                                    )
                                  ]),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 4,
                              width: SizeConfig.screenWidth * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey[200],
                                        offset: Offset.zero)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Medical Report.pdf",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'OpenSans',
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.25),
                                    ),
                                    Icon(
                                      Icons.close,
                                      size: 15,
                                      color: appColorPrimary,
                                    )
                                  ]),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 4,
                              width: SizeConfig.screenWidth * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey[200],
                                        offset: Offset.zero)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Medical Report.pdf",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'OpenSans',
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.25),
                                    ),
                                    Icon(
                                      Icons.close,
                                      size: 15,
                                      color: appColorPrimary,
                                    )
                                  ]),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 4,
                              width: SizeConfig.screenWidth * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey[200],
                                        offset: Offset.zero)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Medical Report.pdf",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'OpenSans',
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.25),
                                    ),
                                    Icon(
                                      Icons.close,
                                      size: 15,
                                      color: appColorPrimary,
                                    )
                                  ]),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 4,
                              width: SizeConfig.screenWidth * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey[200],
                                        offset: Offset.zero)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Medical Report.pdf",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'OpenSans',
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.25),
                                    ),
                                    Icon(
                                      Icons.close,
                                      size: 15,
                                      color: appColorPrimary,
                                    )
                                  ]),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 4,
                              width: SizeConfig.screenWidth * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey[200],
                                        offset: Offset.zero)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Medical Report.pdf",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'OpenSans',
                                          fontSize:
                                              SizeConfig.blockSizeVertical *
                                                  1.25),
                                    ),
                                    Icon(
                                      Icons.close,
                                      size: 15,
                                      color: appColorPrimary,
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 5,
                        ),
                        width: SizeConfig.screenWidth * 0.9,
                        height: SizeConfig.screenHeight * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[200],
                                offset: Offset.zero,
                                spreadRadius: 1.0,
                                blurRadius: 1.0,
                              ),
                            ]),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Describe Your problem ",
                              style: TextStyle(
                                color: apptextcolor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            TextFormField(
                              controller: _textEditingController,
                              keyboardType: TextInputType.text,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: appColorPrimary,
                                        style: BorderStyle.solid,
                                        width: 1.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: appColorPrimary,
                                        style: BorderStyle.solid,
                                        width: 1.0)),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0XFFFF5379),
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0XFFFF5379),
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: appColorPrimary,
                      fillColor: MaterialStateProperty.all(appColorPrimary),
                      value: _rememberMeFlag,
                      onChanged: (value) => setState(() {
                        _rememberMeFlag = !_rememberMeFlag;
                      }),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "I agree to ",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'OpenSans')),
                        TextSpan(
                            text: "terms & conditions.",
                            style: TextStyle(
                                color: apptextcolor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OpenSans")),
                      ]),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: appColorPrimary,
                      fillColor: MaterialStateProperty.all(appColorPrimary),
                      value: _rememberMeFlag2,
                      onChanged: (value) => setState(() {
                        _rememberMeFlag2 = !_rememberMeFlag2;
                      }),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Virtual Care Consulation ",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "OpenSans")),
                        TextSpan(
                            text: "Rs 50.00",
                            style: TextStyle(
                                color: apptextcolor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "OpenSans")),
                      ]),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 5,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentScreen()));
                  },
                  minWidth: SizeConfig.screenWidth - 20,
                  height: 45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: apptextcolor,
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "OpenSans",
                        fontSize: SizeConfig.blockSizeVertical * 2.25),
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
