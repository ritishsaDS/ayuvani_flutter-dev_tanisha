import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/data/repo/LoginRepo.dart';
import 'package:flutter_ayuvani/data/repo/RegisterRepo.dart';
import 'package:flutter_ayuvani/models/LoginCred.dart';
import 'package:flutter_ayuvani/models/UserData.dart';
import 'package:flutter_ayuvani/ui/user/forget_password/Forget_Password_Patient.dart';
import 'package:flutter_ayuvani/ui/user/login/bloc/user_login_bloc.dart';
import 'package:flutter_ayuvani/ui/widgets/BottomNavPageView.dart';
import 'package:flutter_ayuvani/utils/CommonUtil.dart';
import 'package:flutter_ayuvani/utils/SharedPref.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:flutter_ayuvani/utils/SocialLoginMethods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/SizeConfig.dart';
import '../Google_Fb_Sign_Up.dart';
import '../sign_up/Sign_Up_Screen.dart';
import 'login_otp_screen.dart';

class LoginScreenPatient extends StatefulWidget {
  static const route = '/LoginScreenPatient';
  @override
  _LoginScreenPatientState createState() => _LoginScreenPatientState();
}

class _LoginScreenPatientState extends State<LoginScreenPatient> {
  bool checkBoxValue = false;
  bool autoValidate = false;
  var isloading = false;

  Map userfb = {};

  Icon suffixIcon = Icon(
    Icons.visibility,
    color: appColorPrimary,
  );
  bool obscureText = true;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  FocusNode pwdFocusNode;
  FocusNode userFocusNode;
  bool _rememberMe = false;
  final focus = FocusNode();
  bool passwordVisible = true;
  LoginCred credentials;
  var loginrepo = new LoginUserRepo();
  var registerUserRepo = new RegisterUserRepo();

  Future<String> getcred() async {
    var logcrd = await SharedPreferencesTest().logincred("get");
    return logcrd;
  }

  @override
  void initState() {
    super.initState();
    pwdFocusNode = FocusNode();
    userFocusNode = FocusNode();
    getcred().then((cred) {
      setState(() {
        Map usercred = json.decode(cred);
        credentials = LoginCred.fromJson(usercred);
        usernameController.text = credentials.email;
        pwdController.text = credentials.password;
        _rememberMe = credentials.rememberme;
      });
    });
  }

  @override
  void dispose() {
    pwdFocusNode.dispose();
    userFocusNode.dispose();
    super.dispose();
  }

  Userdata loginEntity;
  validate() async {
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      setState(() {
        isloading = true;
      });
      loginrepo
          .loginuser(usernameController.text.trim().toString(),
              pwdController.text.toString(), context)
          .then((value) {
        setState(() async {
          isloading = false;
          if (value.code == 200) {
            print("${value.token}");
            if (_rememberMe) {
              SharedPreferencesTest().logincred("set",
                  logcred: LoginCred(
                      email: usernameController.text.trim().toString(),
                      password: pwdController.text.trim().toString(),
                      rememberme: _rememberMe));
            }
            SharedPreferencesTest().userdetails("set", loginEntity: value);
            Navigator.of(context).pushNamedAndRemoveUntil(
                BottomNavPageView.route, (Route<dynamic> route) => false);
            /* Map userupdateddata = json.decode(response);
              applyeventlabelsloginEntity = LoginEntity.fromJson(userupdateddata);*/
          } else {
            showAlertDialog(context, value.message, "");
          }
        });
      }).catchError((onError) {
        setState(() {
          isloading = false;
        });
      });
      /*  if(rememberme)
      {
        SharedPreferencesTest().logincred("set", logcred: LoginCred(email: email,
            password: password,rememberme:rememberme));
      }*/

    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List<Widget>();
    var child = Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/login bg.png'))),
        child: SingleChildScrollView(
          child: SafeArea(
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
                  child: BlocConsumer<UserLoginBloc, UserLoginState>(
                    listener: (context, state) {
                      if (state is UserLoginSuccessState) {
                        Navigator.pushNamed(context, BottomNavPageView.route);
                      }
                      if (state is UserLoginErrorState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Form(
                              key: loginFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  userNameTextField(context),
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
                                              value: _rememberMe,
                                              onChanged: (value) =>
                                                  setState(() {
                                                _rememberMe = !_rememberMe;
                                              }),
                                            ),
                                          ),
                                          Text(
                                            " Remember Me",
                                            style: TextStyle(
                                                fontFamily: 'OpenSans'),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        child: Text(
                                          'Forget?',
                                          style: TextStyle(
                                              color: appTextColorSecondary),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              ForgetPasswordPatient.route);
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, LoginOtpScreen.route);
                                        },
                                        child: Text(
                                          " Login with OTP",
                                          style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              color: appColorPrimary),
                                        ),
                                      ),
                                      loginButton(context),
                                    ],
                                  ),
                                ],
                              )),
                          if (state is UserLoginLoadingState)
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
                    "Sign in with",
                    style: TextStyle(
                        color: appColorPrimary,
                        fontSize: SizeConfig.blockSizeVertical * 1.90),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    loginWithGoogle();
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.screenHeight * 0.01),
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
                                builder: (context) => SignUpScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.blockSizeVertical * 1.50),
                        child: Text(
                          "SIGNUP",
                          style: TextStyle(
                            color: apptextcolor,
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

    widgetList.add(child);
    if (isloading) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
            ),
          ),
        ],
      );
      widgetList.add(modal);
    }

    return
        /* WillPopScope(
            onWillPop: ,
            child:*/
        Stack(children: widgetList);
  }

  loginButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        // validate();
        context.read<UserLoginBloc>().add(UserLoginFormChangedEvent(
            name: usernameController.text, password: pwdController.text));
        if (loginFormKey.currentState.validate()) {
          context.read<UserLoginBloc>().add(LoginSuccessEvent());
        }
      },
      child: Text(
        "LOGIN",
        style: TextStyle(
            color: appColorPrimary,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold),
      ),
      color: Colors.white,
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
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    offset: Offset.zero,
                    color: Colors.black12,
                    blurRadius: 1)
              ]),
          child: TextFormField(
            autofocus: false,
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
                          Icons.visibility_rounded,
                          color: appColorPrimary,
                        );
                      } else {
                        obscureText = true;
                        suffixIcon = Icon(
                          Icons.visibility_off,
                          color: appColorPrimary,
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
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1.0)),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pink, style: BorderStyle.solid, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pink, style: BorderStyle.solid, width: 1.0),
                ),
                errorStyle: TextStyle(color: Color(0XFFFF5379))),
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
        ),
      ],
    );
  }

  userNameTextField(BuildContext context) {
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
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    offset: Offset.zero,
                    color: Colors.black12,
                    blurRadius: 1)
              ]),
          child: TextFormField(
            autofocus: false,
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
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1.0)),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pink, style: BorderStyle.solid, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pink, style: BorderStyle.solid, width: 1.0),
                ),
                errorStyle: TextStyle(color: appColorPrimary)),
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
          ),
        ),
      ],
    );
  }

  loginWithGoogle() async {
    String password = '123456789';
    return SocialLogin().googleSignin().then((google) => {
          if (google != null)
            {
              if (google.additionalUserInfo.isNewUser)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoogleFBSignUpScreen(
                        name: google.user.displayName,
                        email: google.user.email,
                        number: google.user.phoneNumber,
                      ),
                    ),
                  ),
                }
              else
                {
                  loginrepo
                      .loginuser(
                          google.user.displayName.toString(), password, context)
                      .then((value) {
                    setState(() async {
                      isloading = false;
                      if (value.code == 200) {
                        print("${value.token}");
                        if (_rememberMe) {
                          SharedPreferencesTest().logincred("set",
                              logcred: LoginCred(
                                  email: google.user.email.toString(),
                                  password: password.toString(),
                                  rememberme: _rememberMe));
                        }
                        SharedPreferencesTest()
                            .userdetails("set", loginEntity: value);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            BottomNavPageView.route,
                            (Route<dynamic> route) => false);
                        /* Map userupdateddata = json.decode(response);
              applyeventlabelsloginEntity = LoginEntity.fromJson(userupdateddata);*/
                      } else {
                        showAlertDialog(context, value.message, "");
                      }
                    });
                  })
                }
            }
        });
  }

  // loginWithFaceBook() {
  //   return FacebookAuth.instance
  //       .login(permissions: ["public_profile", "email"]).then((value) {
  //     FacebookAuth.instance.getUserData().then((userDatas) {
  //       setState(() {
  //         userfb = userDatas;
  //
  //         if (userDatas != null) {
  //           print(userDatas['email']);
  //           if (userDatas['email'] == null) {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => GoogleFBSignUpScreen(
  //                   name: userDatas['name'],
  //                   email: userDatas['email'],
  //                 ),
  //               ),
  //             );
  //           } else {
  //             // signup(userDatas['name'],
  //             //     userDatas['email'], "fb");
  //           }
  //           //
  //         }
  //
  //         print(userDatas);
  //       });
  //     });
  //   });
  // }
}
