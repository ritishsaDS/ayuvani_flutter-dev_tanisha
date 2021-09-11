import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/data/repo/new_password_email_varified.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';

import '../login/Login_Screen_Patient.dart';

class NewPasswordField extends StatefulWidget {
  static const route = '/NewPasswordField';

  @override
  _NewPasswordFieldState createState() => _NewPasswordFieldState();
}

class _NewPasswordFieldState extends State<NewPasswordField> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FocusNode newPasswordFoucsNode;
  FocusNode confirmPasswordFoucsNode;
  bool isLoading = false;
  NewPassWordEmailRepo _newPassWordEmailRepo = NewPassWordEmailRepo();
  String newPassword;
  String confirmPassword;

  newAndConfirmPassword(
      {String email, String password, String confirmPassword}) {
    setState(() {
      isLoading = true;
    });
    _newPassWordEmailRepo
        .getEmailOtpConfirmation(
            email: email, password: password, confirmPassword: confirmPassword)
        .then((value) {
      print(value.status);
      if (value.status == 200) {
        Navigator.pushNamed(context, LoginScreenPatient.route);
        toast('Your password is Updated');
      } else {
        setState(() {
          isLoading = false;
        });
        toast(value.message);
      }
    });
  }

  @override
  void initState() {
    newPasswordFoucsNode = FocusNode();
    confirmPasswordFoucsNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    newPasswordFoucsNode.dispose();

    newPasswordController.dispose();
    confirmPasswordFoucsNode.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context).settings.arguments;
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Image(
                    image: AssetImage(
                  "assets/topshapeicon.png",
                )),
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
                  child: Column(
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
                      Form(
                        key: _formKey,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: newPasswordController,
                                  focusNode: newPasswordFoucsNode,
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
                                    hintText: 'Enter New Password',
                                    counterText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    setState(() {
                                      newPassword = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextFormField(
                                  controller: confirmPasswordController,
                                  focusNode: confirmPasswordFoucsNode,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    if (value != newPassword) {
                                      return "Password is not matched";
                                    }
                                    return null;
                                  },
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
                                    hintText: 'Confirm PassWord',
                                    counterText: '',
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    setState(() {
                                      confirmPassword = value;
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
                                    if (_formKey.currentState.validate()) {
                                      newAndConfirmPassword(
                                          email: email,
                                          password: newPassword,
                                          confirmPassword: confirmPassword);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('Password is updated')));
                                    }
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
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
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
