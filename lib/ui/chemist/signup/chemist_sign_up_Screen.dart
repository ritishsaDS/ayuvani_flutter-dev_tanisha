import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/data/repo/RegisterRepo.dart';
import 'package:flutter_ayuvani/ui/chemist/signup/bloc/chemist_signup_bloc.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/SizeConfig.dart';

class ChemistSignUpScreen extends StatefulWidget {
  static const route = '/ChemistSignUpScreen';
  @override
  _ChemistSignUpScreenState createState() => _ChemistSignUpScreenState();
}

class _ChemistSignUpScreenState extends State<ChemistSignUpScreen> {
  GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isloading = false;
  FocusNode nameFocusNode;
  FocusNode usernameFocusNode;
  FocusNode emailFocusNode;
  FocusNode phoneFocusNode;
  FocusNode passwordFocusNode;

  var registerrepo = RegisterUserRepo();

  // validate(BuildContext context) {
  //   if (SignUpFormKey.currentState.validate()) {
  //     SignUpFormKey.currentState.save();
  //     setState(() {
  //       isloading = true;
  //     });
  //     List<String> disability = new List();
  //     if (_diabetes) {
  //       disability.add("1");
  //     }
  //     if (_bloodPressure) {
  //       disability.add("2");
  //     }
  //     if (_allergies) {
  //       disability.add("3");
  //     }
  //     registerrepo
  //         .registeruser(
  //             context,
  //             nameController.text.trim().toString(),
  //             usernameController.text.trim().toString(),
  //             phoneController.text.trim().toString(),
  //             emailController.text.trim().toString(),
  //             'Male',
  //             '1955-11-15',
  //             '45',
  //             '65',
  //             disability,
  //             "email",
  //             '123456789')
  //         .then((value) {
  //       setState(() {
  //         isloading = false;
  //       });
  //       if (value.code == 200) {
  //         print('navigate' + value.code.toString());
  //         showAlertDialog(
  //           context,
  //           value.message,
  //           "Registerd",
  //         );
  //         Navigator.pushNamed(context, ChemistDashboardScreen.route);
  //       } else {
  //         //value.message
  //         print('error ' + value.code.toString());
  //         showAlertDialog(context, value.status, "");
  //       }
  //     }).catchError((onError) {
  //       setState(() {
  //         isloading = false;
  //       });
  //     });
  //   } else {
  //     print("Not Validated");
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    nameFocusNode = FocusNode();
    usernameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  bool _diabetes = false;
  bool _bloodPressure = false;
  bool _allergies = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List<Widget>();

    var child = SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
                image: AssetImage(
              "assets/topshapeicon.png",
            )),
            Column(
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
                    width: SizeConfig.screenWidth * 0.8,
                    child: BlocConsumer<ChemistSignupBloc, ChemistSignupState>(
                      listener: (context, state) {
                        if (state is SignUpSuccessfulState) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  state.chemistRegisterModel.message ??
                                      "Error")));
                          Navigator.pop(context);
                        }
                        if (state is ChemistSignUpErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)));
                        }
                      },
                      builder: (context, state) {
                        return Stack(
                          children: [
                            Form(
                                key: SignUpFormKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text("Name"),
                                      padding: EdgeInsets.only(
                                          bottom:
                                              SizeConfig.screenHeight * 0.01),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      autofocus: true,
                                      focusNode: nameFocusNode,
                                      controller: nameController,
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return "This field is required";
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.only(
                                            top: 4.0, bottom: 4.0, left: 4.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
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
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                      ),
                                      onChanged: (value) {},
                                      cursorColor: appColorPrimary,
                                      onFieldSubmitted: (term) {
                                        nameFocusNode.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(usernameFocusNode);
                                      },
                                    ),
                                    Container(
                                      child: Text("Username"),
                                      padding: EdgeInsets.only(
                                          bottom:
                                              SizeConfig.screenHeight * 0.01,
                                          top: SizeConfig.screenHeight * 0.01),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      focusNode: usernameFocusNode,
                                      textInputAction: TextInputAction.next,
                                      controller: usernameController,
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return "This field is required";
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.only(
                                            top: 4.0, bottom: 4.0, left: 4.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
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
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                      ),
                                      onFieldSubmitted: (term) {
                                        usernameFocusNode.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(phoneFocusNode);
                                      },
                                      cursorColor: appColorPrimary,
                                    ),
                                    Container(
                                      child: Text("Phone"),
                                      padding: EdgeInsets.only(
                                          bottom:
                                              SizeConfig.screenHeight * 0.01,
                                          top: SizeConfig.screenHeight * 0.01),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      focusNode: phoneFocusNode,
                                      textInputAction: TextInputAction.next,
                                      controller: phoneController,
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return "This field is required";
                                        if (value.length < 10) {
                                          return 'Please enter correct number';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.only(
                                            top: 4.0, bottom: 4.0, left: 4.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
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
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                      ),
                                      onFieldSubmitted: (term) {
                                        phoneFocusNode.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(emailFocusNode);
                                      },
                                      cursorColor: appColorPrimary,
                                    ),
                                    Container(
                                      child: Text("Email"),
                                      padding: EdgeInsets.only(
                                          bottom:
                                              SizeConfig.screenHeight * 0.01,
                                          top: SizeConfig.screenHeight * 0.01),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      focusNode: emailFocusNode,
                                      textInputAction: TextInputAction.next,
                                      controller: emailController,
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return "This field is required";
                                        if (!value.contains('@'))
                                          return "Please enter the correct email";
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.only(
                                            top: 4.0, bottom: 4.0, left: 4.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
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
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                      ),
                                      onFieldSubmitted: (term) {
                                        emailFocusNode.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(passwordFocusNode);
                                      },
                                      cursorColor: appColorPrimary,
                                    ),
                                    Container(
                                      child: Text("Password"),
                                      padding: EdgeInsets.only(
                                          bottom:
                                              SizeConfig.screenHeight * 0.01,
                                          top: SizeConfig.screenHeight * 0.01),
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      keyboardType: TextInputType.text,
                                      focusNode: passwordFocusNode,
                                      textInputAction: TextInputAction.next,
                                      controller: passwordController,
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return "This field is required";
                                        if (value.length < 8)
                                          return "Password must be minimum 8 characters";
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.only(
                                            top: 4.0, bottom: 4.0, left: 4.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
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
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                      ),
                                      onFieldSubmitted: (term) {
                                        passwordFocusNode.unfocus();
                                      },
                                      cursorColor: appColorPrimary,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: SizeConfig.screenHeight * 0.01,
                                        bottom: SizeConfig.screenHeight * 0.01,
                                      ),
                                      child: Text('Category'),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width:
                                                  SizeConfig.screenWidth * 0.05,
                                              height: SizeConfig.screenHeight *
                                                  0.05,
                                              child: Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      appColorPrimary,
                                                ),
                                                child: Checkbox(
                                                  focusColor: appColorPrimary,
                                                  hoverColor: appColorPrimary,
                                                  checkColor: Colors.white,
                                                  activeColor: appColorPrimary,
                                                  value: _diabetes,
                                                  onChanged: (value) =>
                                                      setState(() {
                                                    _diabetes = !_diabetes;
                                                  }),
                                                ),
                                              ),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left:
                                                        SizeConfig.screenWidth *
                                                            0.01),
                                                child: Text("Ayurveda",
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .blockSizeVertical *
                                                            1.70)))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width:
                                                  SizeConfig.screenWidth * 0.05,
                                              height: SizeConfig.screenHeight *
                                                  0.05,
                                              child: Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor:
                                                      appColorPrimary,
                                                ),
                                                child: Checkbox(
                                                  focusColor: appColorPrimary,
                                                  hoverColor: appColorPrimary,
                                                  checkColor: Colors.white,
                                                  activeColor: appColorPrimary,
                                                  value: _bloodPressure,
                                                  onChanged: (value) =>
                                                      setState(() {
                                                    _bloodPressure =
                                                        !_bloodPressure;
                                                  }),
                                                ),
                                              ),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left:
                                                        SizeConfig.screenWidth *
                                                            0.01),
                                                child: Text("Homeopathy",
                                                    style: TextStyle(
                                                        fontSize: SizeConfig
                                                                .blockSizeVertical *
                                                            1.70)))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width:
                                                  SizeConfig.screenWidth * 0.05,
                                              height: SizeConfig.screenHeight *
                                                  0.05,
                                              child: Theme(
                                                data: ThemeData(
                                                    unselectedWidgetColor:
                                                        appColorPrimary),
                                                child: Checkbox(
                                                    focusColor: appColorPrimary,
                                                    hoverColor: appColorPrimary,
                                                    checkColor: Colors.white,
                                                    activeColor:
                                                        appColorPrimary,
                                                    value: _allergies,
                                                    onChanged: (value) {
                                                      // context.read<ChemistSignupBloc>().add(SignUpFormChanged(disability: [value]));
                                                      setState(() {
                                                        _allergies =
                                                            !_allergies;
                                                      });
                                                    }),
                                              ),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left:
                                                        SizeConfig.screenWidth *
                                                            0.01),
                                                child: Text(
                                                  "Allopathy",
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .blockSizeVertical *
                                                          1.70),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: MaterialButton(
                                        onPressed: () {
                                          // validate(context);
                                          if (SignUpFormKey.currentState
                                              .validate()) {
                                            print(emailController.text);
                                            context
                                                .read<ChemistSignupBloc>()
                                                .add(SignUpSubmittedForm(
                                                  email: emailController.text,
                                                  userName:
                                                      usernameController.text,
                                                  name: nameController.text,
                                                  dob: '1995-08-15',
                                                  disability: [1, 2, 3],
                                                  loginType: 'email',
                                                  passwords:
                                                      passwordController.text,
                                                  gender: 'Male',
                                                  height: '6',
                                                  phone: phoneController.text,
                                                  weight: '80',
                                                ));
                                          }
                                        },
                                        child: Text(
                                          "SIGNUP",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        color: appColorPrimary,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.blockSizeVertical *
                                              1.50),
                                      child: Text(
                                        "Sign in with google",
                                        style: TextStyle(
                                            color: appColorPrimary,
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.90),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: SizeConfig.screenHeight * 0.01),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: SizeConfig.screenHeight *
                                                  0.01,
                                              right:
                                                  SizeConfig.screenWidth * 0.03,
                                            ),
                                            padding: EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      spreadRadius: 2,
                                                      offset: Offset.zero,
                                                      color: Colors.black12,
                                                      blurRadius: 2)
                                                ]),
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    4,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    5,
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
                                              top: SizeConfig.screenHeight *
                                                  0.01,
                                              left:
                                                  SizeConfig.screenWidth * 0.03,
                                            ),
                                            padding: EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      spreadRadius: 2,
                                                      offset: Offset.zero,
                                                      color: Colors.black12,
                                                      blurRadius: 2)
                                                ]),
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    4,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    5,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 5,
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      1.50),
                                          child: Text(
                                            "Already have an Account ? ",
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    1.90),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // validate(context);
                                            // if (SignUpFormKey.currentState
                                            //     .validate()) {
                                            //   context
                                            //       .read<ChemistSignupBloc>()
                                            //       .add(SignUpSubmittedForm(
                                            //         email: emailController.text,
                                            //         userName:
                                            //             usernameController.text,
                                            //         name: nameController.text,
                                            //         dob: '1995-08-15',
                                            //         disability: [1, 2, 3],
                                            //         loginType: 'email',
                                            //         passwords:
                                            //             passwordController.text,
                                            //         gender: 'Male',
                                            //         height: '6',
                                            //         phone: phoneController.text,
                                            //         weight: '80',
                                            //       ));
                                            // }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: 5,
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    1.50),
                                            child: Text(
                                              "LOGIN  ",
                                              style: TextStyle(
                                                  fontFamily: "OpenSans",
                                                  color: appColorPrimary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      2.1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            state is SignUpLoadingState
                                ? Center(child: CircularProgressIndicator())
                                : Container(),
                          ],
                        );
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    ));

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
              valueColor: new AlwaysStoppedAnimation<Color>(appColorPrimary),
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
}
