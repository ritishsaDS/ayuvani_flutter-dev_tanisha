import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/data/repo/AddedRelationListRepo.dart';
import 'package:flutter_ayuvani/models/Added_Relation_List.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_family_member_form.dart';
import 'added_edit_sceen_family_form.dart';

class AddFamilyList extends StatefulWidget {
  static const route = '/AddFamilyList';
  @override
  _AddFamilyListState createState() => _AddFamilyListState();
}

class _AddFamilyListState extends State<AddFamilyList> {
  String token;

  List<UserData> addedList = [];
  AddedRelationListRepo addedRelationListRepo = AddedRelationListRepo();
  Timer _timer;
  @override
  void initState() {
    super.initState();
    getAddedFamilyList();

    // _timer = Timer.periodic(Duration(seconds: 1), (_) => getAddedFamilyList());
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  getAddedFamilyList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    dynamic data = preferences.getString("userdetail");
    token = jsonDecode(data)['token'];
    print('token $token');
    addedRelationListRepo.getAddRelationList(token: token).then((value) {
      if (value.code == 200) {
        setState(() {
          print('token $token');
          print(' lenght ${addedList?.length}');
          addedList = value.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            'Add Family Details',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: textSizeLarge,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddFamilyMemberForm.route);
            },
            child: Text('Add New'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(appColorPrimary),
            ),
          ),
          addedList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                      itemCount: addedList.length,
                      itemBuilder: (context, index) {
                        return listTileFamilyMembers(addedList, index);
                      }),
                ),
        ],
      ),
    );
  }

  listTileFamilyMembers(List<UserData> addedRelationList, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => AddedFamilyEditScreenForm(
              data: addedRelationList[index],
            ),
          ),
        )
            .then((value) {
          getAddedFamilyList();
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            leading: Icon(
              Icons.person,
              color: appColorPrimary,
            ),
            title: Text(addedRelationList[index].name),
            trailing: Icon(
              Icons.edit,
              color: appColorPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
