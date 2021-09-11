import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';

class OtpPhoneForgetPassword extends StatefulWidget {
  static const route = '/OtpPhoneForgetPassword';

  @override
  _OtpPhoneForgetPasswordState createState() => _OtpPhoneForgetPasswordState();
}

class _OtpPhoneForgetPasswordState extends State<OtpPhoneForgetPassword> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  FocusNode otp1FoucsNode;
  FocusNode otp2FoucsNode;
  FocusNode otp3FoucsNode;
  FocusNode otp4FoucsNode;

  @override
  void initState() {
    otp1FoucsNode = FocusNode();
    otp2FoucsNode = FocusNode();
    otp3FoucsNode = FocusNode();
    otp4FoucsNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    otp1FoucsNode.dispose();
    otp2FoucsNode.dispose();
    otp3FoucsNode.dispose();
    otp4FoucsNode.dispose();
    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image(
              image: AssetImage(
            "assets/topshapeicon.png",
          )),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.003),
                  child: Text(
                    "AYUVANI",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: SizeConfig.blockSizeVertical * 5,
                      fontWeight: FontWeight.w900,
                      color: Colors.orange[700],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03,
                  width: SizeConfig.screenWidth,
                ),
                Text(
                  "OTP Verification",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: SizeConfig.blockSizeVertical * 3,
                      color: appColorPrimary,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: SizeConfig.blockSizeVertical * 10,
                        color: appColorPrimary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40.0,
                              width: 50.0,
                              decoration: BoxDecoration(),
                              child: TextField(
                                controller: otp1Controller,
                                focusNode: otp1FoucsNode,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  counterText: '',
                                  fillColor: Colors.white,
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {},
                              ),
                            ),
                            Container(
                              height: 40.0,
                              width: 50.0,
                              decoration: BoxDecoration(),
                              child: TextField(
                                controller: otp2Controller,
                                focusNode: otp2FoucsNode,
                                maxLength: 1,
                                style: TextStyle(fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  counterText: '',
                                  fillColor: Colors.white,
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {},
                              ),
                            ),
                            Container(
                              height: 40.0,
                              width: 50.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(),
                              child: TextField(
                                maxLength: 1,
                                controller: otp3Controller,
                                focusNode: otp3FoucsNode,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  counterText: '',
                                  fillColor: Colors.white,
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {},
                              ),
                            ),
                            Container(
                              height: 40.0,
                              width: 50.0,
                              decoration: BoxDecoration(),
                              child: TextField(
                                style: TextStyle(fontWeight: FontWeight.w600),
                                maxLength: 1,
                                controller: otp4Controller,
                                focusNode: otp4FoucsNode,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  counterText: '',
                                  fillColor: Colors.white,
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(appColorPrimary),
                            padding: MaterialStateProperty.all(EdgeInsets.all(
                                SizeConfig.blockSizeVertical * 3)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Countinue',
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeVertical * 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
              height: SizeConfig.screenHeight * 0.3,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset("assets/bottompic.png")),
            ),
          )
        ],
      ),
    );
  }
}
