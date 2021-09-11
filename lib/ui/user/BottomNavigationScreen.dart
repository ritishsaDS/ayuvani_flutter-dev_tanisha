import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePageScreen.dart';
import 'PrescriptionScreen.dart';
import 'UserProfile.dart';
import 'medicine_store/medical_store.dart';

class HomeScreenLayoutPage extends StatefulWidget {
  @override
  _HomeScreenLayoutPageState createState() => _HomeScreenLayoutPageState();
}

class _HomeScreenLayoutPageState extends State<HomeScreenLayoutPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    UserProfile(),
    PrescriptionScreen(),
    MedicalStore()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark
        //or set color with: Color(0xFF0000FF)
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          child: Container(
              child: BottomNavigationBar(
            backgroundColor: Colors.pink[100],
            // currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                title: Text(""),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
            selectedFontSize: 13.0,
            unselectedFontSize: 13.0,
          )),
        ),
      ),
    );
  }
}
