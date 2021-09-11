import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';

import '../textfiled_email_forget_password.dart';
import '../textfiled_phone_forget_password.dart';

class ForgetPasswordPatient extends StatelessWidget {
  static const route = '/ForgetPasswordPatient';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  "GET HEALTHCARE ANYWHERE",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: SizeConfig.blockSizeVertical * 1.65,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03,
                  width: SizeConfig.screenWidth,
                ),
                Text(
                  "Forget Password",
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
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 6),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, TextFiledEmailForgetPassword.route);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(appColorPrimary),
                            padding: MaterialStateProperty.all(EdgeInsets.all(
                                SizeConfig.blockSizeVertical * 2))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Send OTP On Email'),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, TextFiledPhoneForgetPassword.route);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(appColorPrimary),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.all(SizeConfig.blockSizeVertical * 2)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Send OTP On Phone'),
                            Icon(Icons.arrow_forward_ios),
                          ],
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
