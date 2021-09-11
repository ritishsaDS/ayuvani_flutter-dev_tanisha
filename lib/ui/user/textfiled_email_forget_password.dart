import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/data/repo/ForgetPasswordOTPRepo.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';

import 'forget_password/otp_email_forget_password.dart';

class TextFiledEmailForgetPassword extends StatefulWidget {
  static const route = '/TextFiledEmailForgetPassword';

  @override
  _TextFiledEmailForgetPasswordState createState() =>
      _TextFiledEmailForgetPasswordState();
}

class _TextFiledEmailForgetPasswordState
    extends State<TextFiledEmailForgetPassword> {
  TextEditingController emailController = TextEditingController();

  FocusNode emailFoucsNode;
  bool isLoading = false;

  ForgotPasswordOtpRepo _forgotPasswordOtpRepo = ForgotPasswordOtpRepo();
  String emailText;

  getOtpOnEmail(String email) {
    setState(() {
      isLoading = true;
    });
    _forgotPasswordOtpRepo.getforgotPassword(email).then((value) {
      if (value.status == 200) {
        Navigator.pushNamed(context, OtpEmailForgetPassword.route,
            arguments: email);
        toast("Email is Varified");
      } else {
        toast('Email is not Registered');
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    emailFoucsNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    emailFoucsNode.dispose();

    emailController.dispose();

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
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.screenHeight * 0.003),
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextField(
                                controller: emailController,
                                focusNode: emailFoucsNode,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 10.0, bottom: 10.0, left: 10.0),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0XFFFF5379),
                                          style: BorderStyle.solid,
                                          width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0XFFFF5379),
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
                                  hintText: 'Enter Email',
                                  counterText: '',
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  setState(() {
                                    emailText = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  getOtpOnEmail(emailText);
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      appColorPrimary),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(
                                          SizeConfig.blockSizeVertical * 3)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Countinue',
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 3,
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
