import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/ui/chemist/chemist_dashboard/chemist_dashboard_screen.dart';
import 'package:flutter_ayuvani/ui/chemist/login/bloc/chemist_login_bloc.dart';
import 'package:flutter_ayuvani/ui/chemist/signup/chemist_sign_up_Screen.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/SizeConfig.dart';

class ChemistLoginScreen extends StatefulWidget {
  static const route = '/ChemistLoginScreen';
  @override
  _ChemistLoginScreenState createState() => _ChemistLoginScreenState();
}

class _ChemistLoginScreenState extends State<ChemistLoginScreen> {
  bool checkBoxValue = false;
  bool autoValidate = false;
  Icon suffixIcon = Icon(
    Icons.visibility,
    color: Colors.white,
  );
  bool obscureText = true;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  FocusNode pwdFocusNode;
  FocusNode userFocusNode;
  bool _rememberMe = false;

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
      loginFormKey.currentState.save();
      Navigator.of(context).pushNamed('/HomePage');
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('assets/login bg.png'))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.screenHeight * 0.003),
                    child: Text(
                      "AYUVANI",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: SizeConfig.blockSizeVertical * 5,
                        fontWeight: FontWeight.w900,
                        color: appColorPrimary,
                      ),
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
                  height: SizeConfig.screenHeight * 0.05,
                  width: SizeConfig.screenWidth,
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.7,
                  child: BlocConsumer<ChemistLoginBloc, ChemistLoginState>(
                    listener: (context, state) {
                      if (state is ChemistLoginErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error.toString())));
                      }

                      if (state is ChemistLoginSucessfulState) {
                        Navigator.pushNamed(
                            context, ChemistDashboardScreen.route);
                      }
                    },
                    builder: (context, state) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Form(
                              key: loginFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  username_textfield(context),
                                  passwordTextField(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.05,
                                            height:
                                                SizeConfig.screenHeight * 0.05,
                                            child: Checkbox(
                                              focusColor: appColorPrimary,
                                              hoverColor: appColorPrimary,
                                              checkColor: Colors.white,
                                              activeColor: appColorPrimary,
                                              value: (state
                                                      is ChemistLoginFormChange)
                                                  ? state.rememberMe
                                                  : false,
                                              onChanged: (value) {
                                                context
                                                    .read<ChemistLoginBloc>()
                                                    .add(
                                                        ChemistLoginFormChangedEvent(
                                                            rememberMeCheckBox:
                                                                value));
                                              },
                                            ),
                                          ),
                                          Text(
                                            " Remember Me",
                                            style: TextStyle(
                                                fontFamily: 'OpenSans'),
                                          ),
                                        ],
                                      ),
                                      Text("Forget?"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " Login with OTP",
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            color: appColorPrimary),
                                      ),
                                      login_button(context),
                                    ],
                                  ),
                                ],
                              )),
                          if (state is ChemistLoginLoadingState)
                            Center(
                              child: CircularProgressIndicator(),
                            )
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                  child: Text(
                    "Sign in with google",
                    style: TextStyle(
                        color: appColorPrimary,
                        fontSize: SizeConfig.blockSizeVertical * 1.90),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: SizeConfig.screenHeight * 0.01,
                          right: SizeConfig.screenWidth * 0.03,
                        ),
                        padding: EdgeInsets.all(2.0),
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
                        height: SizeConfig.blockSizeVertical * 4,
                        width: SizeConfig.blockSizeVertical * 5,
                        child: Image(
                          image: AssetImage(
                            'assets/google.png',
                          ),
                          color: null,
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: SizeConfig.screenHeight * 0.01,
                          left: SizeConfig.screenWidth * 0.03,
                        ),
                        padding: EdgeInsets.all(2.0),
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
                        height: SizeConfig.blockSizeVertical * 4,
                        width: SizeConfig.blockSizeVertical * 5,
                        child: Image(
                          image: AssetImage(
                            'assets/facebook.png',
                          ),
                          color: Colors.blue[700],
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: 5, top: SizeConfig.blockSizeVertical * 1.50),
                      child: Text(
                        "Don't have an account ? ",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: SizeConfig.blockSizeVertical * 1.90),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChemistSignUpScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1.50),
                        child: Text(
                          "SIGNUP",
                          style: TextStyle(
                            color: appColorPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  username_textfield(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Username",
            style: TextStyle(color: Colors.black),
          ),
          padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.01),
        ),
        TextFormField(
          focusNode: userFocusNode,
          controller: usernameController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 4.0, left: 4.0),
              floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    color: Colors.pink, style: BorderStyle.solid, width: 1.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: appColorPrimary,
                    style: BorderStyle.solid,
                    width: 1.0),
              ),
              errorStyle: TextStyle(color: Colors.pink)),
          onFieldSubmitted: (term) {
            userFocusNode.unfocus();
            FocusScope.of(context).requestFocus(pwdFocusNode);
          },
          validator: (value) {
            if (value.isEmpty)
              return "This field is required";
            else
              return null;
          },
          // onChanged: (value) {
          //   context.read<ChemistLoginBloc>().add(
          //         ChemistLoginFormChangedEvent(
          //             email: value),
          //       );
          // },
        ),
      ],
    );
  }

  login_button(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (loginFormKey.currentState.validate()) {
          context.read<ChemistLoginBloc>().add(
                ChemistLoginFormChangedEvent(
                    email: usernameController.text,
                    password: pwdController.text),
              );

          context.read<ChemistLoginBloc>().add(ChemistLoginPressed());
        }
      },
      child: Text(
        "LOGIN",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold),
      ),
      color: appColorPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
  }

  passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Password",
            style: TextStyle(color: Colors.black),
          ),
          padding: EdgeInsets.only(
              bottom: SizeConfig.screenHeight * 0.01,
              top: SizeConfig.screenHeight * 0.02),
        ),
        TextFormField(
          focusNode: pwdFocusNode,
          controller: pwdController,
          obscureText: obscureText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
              suffixIcon: InkWell(
                child: suffixIcon,
                onTap: () {
                  setState(() {
                    if (obscureText == true) {
                      obscureText = false;
                      suffixIcon = Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      );
                    } else {
                      obscureText = true;
                      suffixIcon = Icon(
                        Icons.visibility,
                        color: Colors.black,
                      );
                    }
                  });
                },
              ),
              isDense: true,
              contentPadding: EdgeInsets.only(top: 4.0, left: 4.0),
              floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    color: Colors.pink, style: BorderStyle.solid, width: 1.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: appColorPrimary,
                    style: BorderStyle.solid,
                    width: 1.0),
              ),
              errorStyle: TextStyle(color: Colors.pink)),
          onFieldSubmitted: (term) {
            pwdFocusNode.unfocus();
          },
          validator: (value) {
            if (value.isEmpty)
              return "This field is required";
            else
              return null;
          },
        ),
      ],
    );
  }
}
