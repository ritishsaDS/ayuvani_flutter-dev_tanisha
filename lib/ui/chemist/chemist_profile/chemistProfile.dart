import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/data/repo/UpdateProfile.dart';
import 'package:flutter_ayuvani/models/GetProfileModel.dart';
import 'package:flutter_ayuvani/ui/chemist/login/bloc/chemist_login_bloc.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '.././.././../data/repo/chemist_repo/chemist_profile_repo.dart';
import '../chemist_bottom_bar.dart';

class ChemistProfile extends StatefulWidget {
  static const route = '/ChemistProfile';

  @override
  _ChemistProfileState createState() => _ChemistProfileState();
}

class _ChemistProfileState extends State<ChemistProfile> {
  GlobalKey<FormState> saveFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isloading = false;
  FocusNode nameFocusNode;
  FocusNode ageFocusNode;
  FocusNode addressFocusNode;
  FocusNode emailFocusNode;
  FocusNode phoneFocusNode;
  FocusNode passwordFocusNode;

  bool autoValidate = false;
  bool _diabetes = false;
  bool _bloodPressure = false;
  bool _allergies = false;

  File _profileImage;

  final getProfileModel = GetProfileModel();

  final _picker = ImagePicker();

  final userProfileRepo = ChemistProfileRepo();
  final updateprofile = UpdateProfileRepo();

  var token;

  String _updatedName;
  String _updatedPhone;
  String _updatedEmail;
  String _updatedDob;

  String _updatedImage = '';

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

  getChemistProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    isloading = false;

    // dynamic data = preferences.getString("userdetail");

    print('token here' + token);
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
                  phoneController.text = value.data.phone,
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
        updateprofile
            .updateprofile(
          token: token,
          name: _updatedName,
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

  initialValues() {
    final data = BlocProvider.of<ChemistLoginBloc>(context, listen: false)
        .chemistLoginModel;

    nameController = TextEditingController(text: data.data.name);
    addressController = TextEditingController(text: data.data.address);
    emailController = TextEditingController(text: data.data.email);
    phoneController = TextEditingController(text: data.data.phone);
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
    token = BlocProvider.of<ChemistLoginBloc>(context, listen: false)
        .chemistLoginModel
        .token;

    nameFocusNode = FocusNode();
    ageFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    getChemistProfile();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameFocusNode.dispose();
    addressFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();

    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<ChemistLoginBloc>(context, listen: false)
        .chemistLoginModel;
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal * 30),
                    child: Container(
                      child: data.data.profilePic != null
                          ? NetworkImage(_updatedImage)
                          : Icon(
                              Icons.person_rounded,
                              size: SizeConfig.blockSizeHorizontal * 10,
                            ),
                    ),
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
            !isloading
                ? Center(child: CircularProgressIndicator())
                : formCard(),
          ],
        ),
      ),
      bottomNavigationBar: ChemistBottomNav(3, true),
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
                  child: Text("Shop Name"),
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
                    FocusScope.of(context).requestFocus(phoneFocusNode);
                  },
                  onChanged: (value) {
                    setState(() {
                      _updatedName = value;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      _updatedPhone = value;
                    });
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
                    FocusScope.of(context).requestFocus(phoneFocusNode);
                  },
                  onChanged: (value) {
                    setState(() {
                      _updatedEmail = value;
                    });
                  },
                  cursorColor: appColorPrimary,
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
                            child: Text("Ayurveda",
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
                            child: Text("Homeopathy",
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
                              "Allopathy",
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
