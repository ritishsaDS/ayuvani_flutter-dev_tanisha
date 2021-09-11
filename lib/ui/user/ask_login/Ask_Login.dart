import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/SizeConfig.dart';
import '../../chemist/login/Login_Screen_Chemist.dart';
import '../login/Login_Screen_Patient.dart';

class AskLoginScreen extends StatefulWidget {
  @override
  _AskLoginScreenState createState() => _AskLoginScreenState();
}

class _AskLoginScreenState extends State<AskLoginScreen> {
  bool checkBoxValue = false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  FocusNode pwdFocusNode;
  FocusNode userFocusNode;

  @override
  void initState() {
    super.initState();
    pwdFocusNode = FocusNode();
    userFocusNode = FocusNode();
  }

  @override
  void dispose() {
    pwdFocusNode.dispose();
    userFocusNode.dispose();
    super.dispose();
  }

  validate() {
    if (loginFormKey.currentState.validate()) {
      //print("Validated");
      Navigator.of(context).pushNamed('/HomePage');
    } else {
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/ask login bg.png'),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            top: SizeConfig.screenHeight * 0.08,
            left: SizeConfig.screenWidth * 0.1,
            right: SizeConfig.screenWidth * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "AYUVANI",
                      style: TextStyle(
                          color: appColorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeVertical * 5),
                    ),
                  ),
                  Container(
                      child: Text(
                    "GET HEALTHCARE ANYWHERE",
                    style: TextStyle(
                        color: appColorPrimary,
                        fontSize: SizeConfig.blockSizeVertical * 1.5),
                  )),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.2,
                    width: SizeConfig.screenWidth,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreenPatient.route);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.screenHeight * 0.01),
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.blockSizeHorizontal * 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                offset: Offset.zero,
                                color: Colors.black12,
                                blurRadius: 2)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageIcon(
                            AssetImage('assets/icon1.png'),
                            color: appColorPrimary,
                          ),
                          Text(
                            'As a Patient',
                            style: GoogleFonts.openSans(
                              color: appColorPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeVertical * 2.25,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: appColorPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ChemistLoginScreen.route);
                    },
                    child: Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.blockSizeHorizontal * 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                offset: Offset.zero,
                                color: Colors.black12,
                                blurRadius: 2)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageIcon(
                            AssetImage('assets/icon2.png'),
                            color: appColorPrimary,
                          ),
                          Text(
                            'Login As Chemist',
                            style: GoogleFonts.openSans(
                                color: appColorPrimary,
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConfig.blockSizeVertical * 2.25),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: appColorPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
