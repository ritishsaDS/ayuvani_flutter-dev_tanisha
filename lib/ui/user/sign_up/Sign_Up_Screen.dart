import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/data/repo/RegisterRepo.dart';
import 'package:flutter_ayuvani/ui/user/login/Login_Screen_Patient.dart';
import 'package:flutter_ayuvani/utils/CommonUtil.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:intl/intl.dart';

import '../../../utils/SizeConfig.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();

  List<String> listOfSex = ["Male", "Female"]; // Option 2
  String _selecetedGender;

  getDropDownValue(String value) {
    setState(() {
      _selecetedGender = value;
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  var isloading = false;
  FocusNode nameFocusNode;
  FocusNode usernameFocusNode;
  FocusNode emailFocusNode;
  FocusNode phoneFocusNode;
  FocusNode passwordFocusNode;
  FocusNode genderFocusNode;
  FocusNode dobFocusNode;
  FocusNode heightFocusNode;
  FocusNode weightFocusNode;
  var registerrepo = new RegisterUserRepo();

  validate() {
    if (SignUpFormKey.currentState.validate()) {
      SignUpFormKey.currentState.save();
      setState(() {
        isloading = true;
      });
      List<String> disability = new List();
      if (_diabetes) {
        disability.add("1");
      }
      if (_bloodPressure) {
        disability.add("2");
      }
      if (_allergies) {
        disability.add("3");
      }
      registerrepo
          .registeruser(
        context,
        nameController.text.trim().toString(),
        usernameController.text.trim().toString(),
        phoneController.text.trim().toString(),
        emailController.text.trim().toString(),
        _selecetedGender,
        dobController.text.trim().toString(),
        heightController.text.trim().toString(),
        weightController.text.trim().toString(),
        disability,
        "email",
        passwordController.text.trim().toString(),
      )
          .then((value) {
        setState(() {
          isloading = false;
        });
        if (value.code == 200) {
          showAlertDialog(context, value.message, "Registerd");
          Navigator.pushNamed(context, LoginScreenPatient.route);
        } else {
          //value.message
          showAlertDialog(context, value.status, "");
        }
      }).catchError((onError) {
        setState(() {
          isloading = false;
        });
      });
    } else {
      print("Not Validated");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    nameFocusNode = FocusNode();
    usernameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    genderFocusNode = FocusNode();
    dobFocusNode = FocusNode();
    heightFocusNode = FocusNode();
    weightFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameFocusNode.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    genderFocusNode.dispose();
    dobFocusNode.dispose();
    heightFocusNode.dispose();
    weightFocusNode.dispose();
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
                  child: Form(
                      key: SignUpFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text("Name"),
                            padding: EdgeInsets.only(
                                bottom: SizeConfig.screenHeight * 0.01),
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
                                bottom: SizeConfig.screenHeight * 0.01,
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
                                    color: Color(0XFFFF5379),
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
                                bottom: SizeConfig.screenHeight * 0.01,
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
                                    color: Color(0XFFFF5379),
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
                                bottom: SizeConfig.screenHeight * 0.01,
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
                                    color: Color(0XFFFF5379),
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
                                bottom: SizeConfig.screenHeight * 0.01,
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
                                    color: Color(0XFFFF5379),
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
                              FocusScope.of(context)
                                  .requestFocus(genderFocusNode);
                            },
                            cursorColor: appColorPrimary,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text("Gender"),
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.screenHeight * 0.01),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.screenHeight * 0.01),
                                    width: SizeConfig.screenWidth * 0.3,
                                    child: dropDownGender(),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: SizeConfig.screenWidth * 0.3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text("DOB"),
                                          padding: EdgeInsets.only(
                                              bottom: SizeConfig.screenHeight *
                                                  0.01,
                                              top: SizeConfig.screenHeight *
                                                  0.01),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2025),
                                              ).then((value) {
                                                setState(() {
                                                  print(value);
                                                  String date =
                                                      DateFormat("dd/MM/yyyy")
                                                          .format(value);
                                                  dobController.text = date;
                                                });
                                              });
                                            },
                                            child: Container(
                                                child: Icon(
                                              Icons.calendar_today,
                                              size:
                                                  SizeConfig.blockSizeVertical *
                                                      2.5,
                                              color: apptextcolor,
                                            )))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth * 0.3,
                                    child: TextFormField(
                                      keyboardType: TextInputType.datetime,
                                      focusNode: dobFocusNode,
                                      enabled: false,
                                      textInputAction: TextInputAction.next,
                                      controller: dobController,
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
                                        disabledBorder: OutlineInputBorder(
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
                                              color: appColorPrimary,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                        ),
                                      ),
                                      onFieldSubmitted: (term) {
                                        dobFocusNode.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(heightFocusNode);
                                      },
                                      cursorColor: appColorPrimary,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text("Height"),
                                    padding: EdgeInsets.only(
                                        bottom: SizeConfig.screenHeight * 0.01,
                                        top: SizeConfig.screenHeight * 0.01),
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth * 0.3,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      focusNode: heightFocusNode,
                                      textInputAction: TextInputAction.next,
                                      controller: heightController,
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
                                              color: Color(0XFFFF5379),
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
                                        heightFocusNode.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(weightFocusNode);
                                      },
                                      cursorColor: appColorPrimary,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text("Weight"),
                                    padding: EdgeInsets.only(
                                        bottom: SizeConfig.screenHeight * 0.01,
                                        top: SizeConfig.screenHeight * 0.01),
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth * 0.3,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      focusNode: weightFocusNode,
                                      textInputAction: TextInputAction.done,
                                      controller: weightController,
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
                                              color: Color(0XFFFF5379),
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
                                        weightFocusNode.unfocus();
                                      },
                                      cursorColor: appColorPrimary,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.01,
                              bottom: SizeConfig.screenHeight * 0.01,
                            ),
                            child: Text('Pre-Existing Condition'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: SizeConfig.screenWidth * 0.05,
                                    height: SizeConfig.screenHeight * 0.05,
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor: appColorPrimary,
                                      ),
                                      child: Checkbox(
                                        focusColor: appColorPrimary,
                                        hoverColor: appColorPrimary,
                                        checkColor: Colors.white,
                                        activeColor: appColorPrimary,
                                        value: _diabetes,
                                        onChanged: (value) => setState(() {
                                          _diabetes = !_diabetes;
                                        }),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.screenWidth * 0.01),
                                      child: Text("Diabetes",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      1.70)))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: SizeConfig.screenWidth * 0.05,
                                    height: SizeConfig.screenHeight * 0.05,
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor: appColorPrimary,
                                      ),
                                      child: Checkbox(
                                        focusColor: appColorPrimary,
                                        hoverColor: appColorPrimary,
                                        checkColor: Colors.white,
                                        activeColor: appColorPrimary,
                                        value: _bloodPressure,
                                        onChanged: (value) => setState(() {
                                          _bloodPressure = !_bloodPressure;
                                        }),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.screenWidth * 0.01),
                                      child: Text("Blood Pressure",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      1.70)))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: SizeConfig.screenWidth * 0.05,
                                    height: SizeConfig.screenHeight * 0.05,
                                    child: Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor:
                                              appColorPrimary),
                                      child: Checkbox(
                                        focusColor: appColorPrimary,
                                        hoverColor: appColorPrimary,
                                        checkColor: Colors.white,
                                        activeColor: appColorPrimary,
                                        value: _allergies,
                                        onChanged: (value) => setState(() {
                                          _allergies = !_allergies;
                                        }),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.screenWidth * 0.01),
                                      child: Text(
                                        "Allergies",
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    1.70),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Center(
                            child: MaterialButton(
                              onPressed: () {
                                validate();
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
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1.50),
                            child: Text(
                              "Sign in with google",
                              style: TextStyle(
                                  color: appColorPrimary,
                                  fontSize:
                                      SizeConfig.blockSizeVertical * 1.90),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.01),
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
                                    right: 5,
                                    top: SizeConfig.blockSizeVertical * 1.50),
                                child: Text(
                                  "Already have an Account ? ",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 1.90),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  validate();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: 5,
                                      top: SizeConfig.blockSizeVertical * 1.50),
                                  child: Text(
                                    "LOGIN  ",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        color: appColorPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2.1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
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

  dropDownGender() {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
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
                color: Color(0XFFFF5379), style: BorderStyle.solid, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: appColorPrimary, style: BorderStyle.solid, width: 1.0),
          ),
        ),
        validator: (value) => value == null ? 'Select your gender' : null,
        iconEnabledColor: appColorPrimary,
        iconDisabledColor: appColorPrimary,
        focusNode: genderFocusNode,
        value: _selecetedGender,
        hint: Text('Select ...'),
        onChanged: (value) {
          getDropDownValue(value);
          genderFocusNode.unfocus();
          FocusScope.of(context).requestFocus(dobFocusNode);
        },
        items: listOfSex.map((listValue) {
          return DropdownMenuItem(
            value: listValue,
            child: Center(child: Text(listValue)),
          );
        }).toList());
  }
}
