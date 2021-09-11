import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/data/repo/EditAddedFamilyRepo.dart';
import 'package:flutter_ayuvani/data/repo/RelationDropDownRepo.dart';
import 'package:flutter_ayuvani/data/repo/deleteAddedFamilyRepo.dart';
import 'package:flutter_ayuvani/models/AddRelationDropDown.dart';
import 'package:flutter_ayuvani/models/Added_Relation_List.dart';
import 'package:flutter_ayuvani/models/EditAdded_Relation.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddedFamilyEditScreenForm extends StatefulWidget {
  static const route = '/AddedFamilyEditScreenForm';

  UserData data;
  List<DropDownMenuModel> categoryfromserver = [];

  AddedFamilyEditScreenForm({this.data});

  @override
  _AddedFamilyEditScreenFormState createState() =>
      _AddedFamilyEditScreenFormState();
}

class _AddedFamilyEditScreenFormState extends State<AddedFamilyEditScreenForm> {
  GlobalKey<FormState> saveFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  FocusNode nameFocusNode;
  FocusNode ageFocusNode;
  FocusNode addressFocusNode;
  FocusNode emailFocusNode;
  FocusNode phoneFocusNode;
  FocusNode dobFocusNode;
  FocusNode relationFocusNode;

  var isloading = false;
  String name;
  int age;
  String address;
  String email;
  int phone;
  String dob;
  int userRelationId;
  int userId;
  dynamic categoryfromserver = [];

  final editAddedFamilyRepo = EditAddedFamilyRepo();
  final deleteAddedRelationrepo = DeleteAddedRelationRepo();

  @override
  void initState() {
    nameFocusNode = FocusNode();
    ageFocusNode = FocusNode();
    addressFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    dobFocusNode = FocusNode();
    relationFocusNode = FocusNode();
    setListDataFromPreviousScreen();
    getDropDownList();
    super.initState();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    ageFocusNode.dispose();
    addressFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    dobFocusNode.dispose();
    relationFocusNode.dispose();
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.dispose();
  }

  setListDataFromPreviousScreen() {
    setState(() {
      nameController.text = widget.data.name;
      ageController.text = widget.data.age.toString();
      addressController.text = widget.data.address;
      emailController.text = widget.data.email;
      phoneController.text = widget.data.phoneNo.toString();
      dobController.text = widget.data.dob;
      userRelationId = widget.data.relationId;
      userId = widget.data.id;
    });
  }

  editFamilyMemberDetails(
      EditAddedFamilyRelation editAddedFamilyRelation) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    dynamic data = preferences.getString("userdetail");
    var token = jsonDecode(data)['token'];
    editAddedFamilyRepo
        .editAddedRelation(token, editAddedFamilyRelation)
        .then((value) => {
              if (value)
                {
                  toast("Profile Updated Successfully!"),
                }
            });
  }

  deleteAddedRelation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    dynamic data = preferences.getString("userdetail");
    var token = jsonDecode(data)['token'];
    deleteAddedRelationrepo.deleteAddedRelation(token, userId).then((value) => {
          if (value)
            {
              toast("Profile Deleted Successfully!"),
            }
        });
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
                Image.asset('assets/topshapeicon.png'),
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
            Text(
              'Update Family Details',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: textSizeLarge,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600),
              ),
            ),
            widget.data == null
                ? CircularProgressIndicator()
                : addFamilyformCard()
          ],
        ),
      ),
    );
  }

  addFamilyformCard() {
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
                Container(
                  child: Text("Relation"),
                  padding:
                      EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.01),
                ),
                dropDownGender(),
                SizedBox(
                  height: 20,
                ),
                nameTextField(),
                SizedBox(
                  height: 20,
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
                                dob = date;
                                dobController.text = date;
                              });
                            });
                          },
                          child: Container(
                            width: SizeConfig.screenWidth * 0.5,
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
                                    top: 10.0, bottom: 10.0, left: 10.0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0XFFFF5379),
                                        style: BorderStyle.solid,
                                        width: 1.0)),
                                disabledBorder: OutlineInputBorder(
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
                              ),
                              onFieldSubmitted: (term) {
                                dobFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(ageFocusNode);
                              },
                              cursorColor: Color(0XFFFF5379),
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
                            ),
                            onFieldSubmitted: (term) {
                              ageFocusNode.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(phoneFocusNode);
                            },
                            cursorColor: Color(0XFFFF5379),
                            onSaved: (value) {
                              age = int.parse(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                phoneTextField(),
                SizedBox(
                  height: 20,
                ),
                emailTextField(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    deleteButton(),
                    updateButton(),
                  ],
                )
              ],
            )),
      ),
    );
  }

  nameTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text("Name"),
          padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.01),
        ),
        TextFormField(
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
                EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
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
          ),
          cursorColor: Color(0XFFFF5379),
          onFieldSubmitted: (term) {
            nameFocusNode.unfocus();
            FocusScope.of(context).requestFocus(dobFocusNode);
          },
          onSaved: (value) {
            name = value;
          },
        ),
      ],
    );
  }

  emailTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            if (value.isEmpty) return "This field is required";
            return null;
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
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
          ),
          onFieldSubmitted: (term) {
            emailFocusNode.unfocus();
          },
          cursorColor: Color(0XFFFF5379),
          onSaved: (value) {
            email = value;
          },
        ),
      ],
    );
  }

  phoneTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            if (value.isEmpty) return "This field is required";
            return null;
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
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
          ),
          onFieldSubmitted: (term) {
            phoneFocusNode.unfocus();
            FocusScope.of(context).requestFocus(emailFocusNode);
          },
          cursorColor: Color(0XFFFF5379),
          onSaved: (value) {
            phone = int.parse(value);
          },
        ),
      ],
    );
  }

  deleteButton() {
    return MaterialButton(
      onPressed: () {
        deleteAddedRelation();
        Navigator.pop(context);
      },
      child: Text(
        "Delete",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600),
      ),
      color: Colors.pink[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
  }

  updateButton() {
    return MaterialButton(
      onPressed: () {
        //todo:fix with latest api changes
        if (saveFormKey.currentState.validate()) {
          saveFormKey.currentState.save();
          final addFamilyModel = EditAddedFamilyRelation(
              dob: dob ??= widget.data.dob,
              email: 'email@gmail.com',
              phone: 123456789,
              relationId: userId,
              age: age,
              selectedRelationItemId: userRelationId,
              name: name,
              address: 'address');
          editFamilyMemberDetails(addFamilyModel);
          Navigator.pop(context);
        } else {
          toast('There is something wrong');
        }
      },
      child: Text(
        "Update",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600),
      ),
      color: appColorPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );
  }

  getDropDownList() {
    final dropDownRepo = RelationDropDownRepo();
    dropDownRepo.getAllUsers().then((value) {
      setState(() {
        categoryfromserver = value;
      });
    });
  }

  dropDownGender() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
              color: Color(0XFFFF5379), style: BorderStyle.solid, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0XFFFF5379), style: BorderStyle.solid, width: 1.0),
        ),
      ),
      validator: (value) => value == null ? 'Select your gender' : null,
      iconEnabledColor: appColorPrimary,
      iconDisabledColor: appColorPrimary,
      focusNode: relationFocusNode,
      hint: Text(categoryfromserver[userRelationId]['name']),
      items: categoryfromserver
          .map<DropdownMenuItem<String>>(
              (value) => new DropdownMenuItem<String>(
                    value: value["id"].toString(),
                    child: Text(
                      value["name"],
                    ),
                  ))
          .toList(),
      onChanged: (newVal) {
        print("id" + newVal.toString());
        setState(() {
          userRelationId = int.parse(newVal);
          print("use relaion $userRelationId+1");
        });
      },
      // value: categoryfromserver.map<String>(
      //   (value) => {value[userRelationId]["name"]},
      // ),
    );
  }
}
