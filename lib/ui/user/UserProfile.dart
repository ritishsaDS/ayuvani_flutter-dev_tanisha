import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/data/repo/GetProfileRepo.dart';
import 'package:flutter_ayuvani/data/repo/UpdateProfile.dart';
import 'package:flutter_ayuvani/models/GetProfileModel.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/bloc/user_login_bloc.dart';

class UserProfile extends StatefulWidget {
  static const route = '/UserProfile';

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  GlobalKey<FormState> saveFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  var isloading = false;
  FocusNode nameFocusNode;
  FocusNode ageFocusNode;
  FocusNode addressFocusNode;
  FocusNode emailFocusNode;
  FocusNode phoneFocusNode;
  FocusNode passwordFocusNode;
  FocusNode genderFocusNode;
  FocusNode dobFocusNode;
  FocusNode heightFocusNode;
  FocusNode weightFocusNode;

  bool autoValidate = false;
  bool _diabetes = false;
  bool _bloodPressure = false;
  bool _allergies = false;

  File _profileImage;

  final getProfileModel = GetProfileModel();

  final _picker = ImagePicker();

  final userProfileRepo = GetProfileRepo();
  final updateprofile = UpdateProfileRepo();

  String _updatedName;
  String _updatedPhone;
  String _updatedEmail;
  String _updatedGender;
  String _updatedDob;
  String _updatedHeight;
  String _updatedWeight;
  String _updatedImage;

  _profileImageCamera() async {
    PickedFile image =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _profileImage = File(image.path);
      print(_profileImage.path);
    });
  }

  _profileImageGallery() async {
    PickedFile image =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _profileImage = File(image.path);
      print(_profileImage.path);
    });
  }

  calculateAge(String birthDate) {
    DateTime currentDate = DateTime.now();
    String removedSlash = birthDate.replaceAll("/", "-");
    var formatedDate = DateFormat('dd-MM-yyyy').parse(removedSlash);
    print('age ${formatedDate.year}');
    int age = currentDate.year - formatedDate.year;
    return '$age';
  }

  var listOfDisablities;

  getUserProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    isloading = false;

    dynamic data = preferences.getString("userdetail");
    // token = jsonDecode(data)['token'];
    final token = BlocProvider.of<UserLoginBloc>(context, listen: false)
        .chemistLoginModel
        .token;
    print(token);
    userProfileRepo.getprofile(context, token).then((value) => {
          if (value.code == 200)
            {
              if (value.data != null)
                {
                  setState(() {
                    isloading = true;
                  }),
                  nameController.text = value.data.name,
                  emailController.text = value.data.email,
                  genderController.text = value.data.gender,
                  phoneController.text = value.data.phone,
                  dobController.text = value.data.dob,
                  weightController.text = value.data.weight,
                  heightController.text = value.data.height,
                  ageController.text = calculateAge(value.data.dob),
                  listOfDisablities = value.data.disability,
                  print(listOfDisablities[1].toString().contains('1')),
                  if (listOfDisablities[1].toString().contains('1'))
                    {
                      setState(() {
                        _diabetes = true;
                      })
                    },
                  if (listOfDisablities[4].toString().contains('2'))
                    {
                      setState(() {
                        _bloodPressure = true;
                      })
                    },
                  if (listOfDisablities[7].toString().contains('3'))
                    {
                      setState(() {
                        _allergies = true;
                      })
                    }
                }
            }
        });
  }

  updateUserProfile() {
    {
      if (saveFormKey.currentState.validate()) {
        saveFormKey.currentState.save();
        setState(() {
          isloading = true;
        });
        final token = BlocProvider.of<UserLoginBloc>(context, listen: false)
            .chemistLoginModel
            .token;
        print('token update profile' + token);
        updateprofile
            .updateprofile(
          token: token,
          name: _updatedName,
          gender: _updatedGender,
          height: _updatedHeight,
          weight: _updatedWeight,
          phone: _updatedPhone,
          image: _updatedImage,
          email: _updatedEmail,
          dob: _updatedDob,
        )
            .then((value) {
          setState(() {
            isloading = false;
          });
          toast("Profile Updated Successfully!");
        }).catchError((onError) {
          setState(() {
            isloading = false;
          });
          toast("Something went Wrong!");
        });
      } else {
        autoValidate = true;
      }
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _profileImageGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _profileImageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    nameFocusNode = FocusNode();
    ageFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    genderFocusNode = FocusNode();
    dobFocusNode = FocusNode();
    heightFocusNode = FocusNode();
    weightFocusNode = FocusNode();

    getUserProfile();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    addressFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    genderFocusNode.dispose();
    dobFocusNode.dispose();
    heightFocusNode.dispose();
    weightFocusNode.dispose();
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    genderController.dispose();
    dobController.dispose();
    heightController.dispose();
    weightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Image.asset('assets/topshapeicon.png'),
                  ],
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: AppBar(
                    leading: new IconButton(
                      icon: new Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    backgroundColor:
                        Colors.transparent, //You can make this transparent
                    elevation: 0.0, //No shadow
                  ),
                ),
              ],
            ),
            Stack(
              overflow: Overflow.visible,
              children: [
                GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(SampleProfileImageUrl),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: -30,
                  child: IconButton(
                      color: appColorPrimary,
                      icon: Icon(Icons.edit_location_rounded),
                      onPressed: () {}),
                )
              ],
            ),
            Stack(
              children: [
                formCard(),
                if (!isloading)
                  Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator())
              ],
            ),
          ],
        ),
      ),
    );
  }

  formCard() {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: saveFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeVertical * 2.9,
                          fontFamily: 'OpenSans'),
                    ),
                  ),
                ),
                Container(
                  child: Text("Name"),
                  padding:
                      EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.01),
                ),
                TextFormField(
                  autovalidate: autoValidate,
                  keyboardType: TextInputType.text,
                  focusNode: nameFocusNode,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) return "This field is required";
                    return null;
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
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
                  cursorColor: appColorPrimary,
                  onFieldSubmitted: (term) {
                    nameFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(dobFocusNode);
                  },
                  onChanged: (value) {
                    setState(() {
                      _updatedName = value;
                    });
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text("DOB"),
                                padding: EdgeInsets.only(
                                    bottom: SizeConfig.screenHeight * 0.01,
                                    top: SizeConfig.screenHeight * 0.01),
                              ),
                              Container(
                                  child: Icon(
                                Icons.calendar_today,
                                size: SizeConfig.blockSizeVertical * 2.5,
                                color: apptextcolor,
                              ))
                            ],
                          ),
                        ),
                        GestureDetector(
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
                                    DateFormat("dd/MM/yyyy").format(value);
                                dobController.text = date;
                              });
                            });
                          },
                          child: Container(
                            width: SizeConfig.screenWidth * 0.5,
                            child: TextFormField(
                              autovalidate: autoValidate,
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
                                      color: Color(0XFFFF5379),
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                ),
                              ),
                              onFieldSubmitted: (term) {
                                dobFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(heightFocusNode);
                              },
                              onSaved: (value) {
                                _updatedDob = value ?? dobController.text;
                              },
                              cursorColor: appColorPrimary,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("Age"),
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.screenHeight * 0.01,
                              top: SizeConfig.screenHeight * 0.01),
                        ),
                        Container(
                          width: SizeConfig.screenWidth * 0.3,
                          child: TextFormField(
                            autovalidate: autoValidate,
                            keyboardType: TextInputType.number,
                            focusNode: ageFocusNode,
                            textInputAction: TextInputAction.next,
                            controller: ageController,
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
                                    color: Color(0XFFFF5379),
                                    style: BorderStyle.solid,
                                    width: 1.0),
                              ),
                            ),
                            onFieldSubmitted: (term) {
                              ageFocusNode.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(phoneFocusNode);
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                            cursorColor: appColorPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Text("Phone"),
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.01,
                      top: SizeConfig.screenHeight * 0.01),
                ),
                TextFormField(
                  autovalidate: autoValidate,
                  keyboardType: TextInputType.phone,
                  focusNode: phoneFocusNode,
                  textInputAction: TextInputAction.next,
                  controller: phoneController,
                  validator: (value) {
                    if (value.isEmpty) return "This field is required";
                    return null;
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
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
                  onFieldSubmitted: (term) {
                    phoneFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(emailFocusNode);
                  },
                  cursorColor: appColorPrimary,
                  onChanged: (value) {
                    setState(() {
                      _updatedPhone = value ?? phoneController.text;
                    });
                  },
                ),
                Container(
                  child: Text("Email"),
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.screenHeight * 0.01,
                      top: SizeConfig.screenHeight * 0.01),
                ),
                TextFormField(
                  autovalidate: autoValidate,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  validator: (value) {
                    if (value.isEmpty) return "This field is required";
                    return null;
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
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
                  onFieldSubmitted: (term) {
                    emailFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(genderFocusNode);
                  },
                  cursorColor: appColorPrimary,
                  onChanged: (value) {
                    setState(() {
                      _updatedEmail = value ?? emailController.text;
                    });
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Gender"),
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.screenHeight * 0.01,
                          top: SizeConfig.screenHeight * 0.01),
                    ),
                    Container(
                      child: TextFormField(
                        autovalidate: autoValidate,
                        keyboardType: TextInputType.text,
                        focusNode: genderFocusNode,
                        textInputAction: TextInputAction.next,
                        controller: genderController,
                        validator: (value) {
                          if (value.isEmpty) return "This field is required";
                          return null;
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
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
                        onFieldSubmitted: (term) {
                          genderFocusNode.unfocus();
                          FocusScope.of(context).requestFocus(heightFocusNode);
                        },
                        cursorColor: appColorPrimary,
                        onChanged: (value) {
                          setState(() {
                            _updatedGender = value ?? genderController.text;
                          });
                        },
                      ),
                    )
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
                            autovalidate: autoValidate,
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
                                    color: Color(0XFFFF5379),
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
                            onChanged: (value) {
                              setState(() {
                                _updatedHeight = value ?? heightController.text;
                              });
                            },
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
                            autovalidate: autoValidate,
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
                                    color: Color(0XFFFF5379),
                                    style: BorderStyle.solid,
                                    width: 1.0),
                              ),
                            ),
                            onFieldSubmitted: (term) {
                              weightFocusNode.unfocus();
                            },
                            cursorColor: appColorPrimary,
                            onChanged: (value) {
                              setState(() {
                                _updatedWeight = value ?? weightController.text;
                              });
                            },
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
                                        SizeConfig.blockSizeVertical * 1.70)))
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
                                        SizeConfig.blockSizeVertical * 1.70)))
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
                                unselectedWidgetColor: appColorPrimary),
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
                                      SizeConfig.blockSizeVertical * 1.70),
                            )),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: MaterialButton(
                    onPressed: () {
                      updateUserProfile();
                    },
                    child: Text(
                      "Save",
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
              ],
            )),
      ),
    );
  }
}
