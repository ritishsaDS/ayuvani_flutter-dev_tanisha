import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/ui/user/HomePageScreen.dart';
import 'package:flutter_ayuvani/ui/user/PrescriptionScreen.dart';
import 'package:flutter_ayuvani/ui/user/UserProfile.dart';
import 'package:flutter_ayuvani/ui/user/medicine_store/medical_store.dart';

class BottomNavPageView extends StatefulWidget {
  static String route = '/BottomNav';
  Color color;

  BottomNavPageView({this.color});

  @override
  _BottomNavPageViewState createState() => _BottomNavPageViewState();
}

class _BottomNavPageViewState extends State<BottomNavPageView> {
  PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark
        //or set color with: Color(0xFF0000FF)
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _myPage,
        children: <Widget>[
          HomePage(),
          UserProfile(),
          PrescriptionScreen(),
          MedicalStore()
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            unselectedItemColor:
                widget.color != null ? widget.color : Colors.white60,
            selectedItemColor: Colors.white,
            backgroundColor: appColorPrimary,
            currentIndex: selectedPage,
            // selectedItemColor: Colors.black54,
            // unselectedItemColor: Colors.black54,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.quickreply_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_chart),
                label: '',
              ),
            ],
            onTap: (index) {
              setState(
                () {
                  selectedPage = index;
                  switch (selectedPage) {
                    case 0:
                      _myPage.jumpToPage(0);
                      setState(() {
                        selectedPage = 0;
                      });
                      break;
                    case 1:
                      _myPage.jumpToPage(1);
                      setState(() {
                        selectedPage = 1;
                      });
                      break;

                    case 2:
                      _myPage.jumpToPage(2);
                      setState(() {
                        selectedPage = 2;
                      });
                      break;
                    case 3:
                      _myPage.jumpToPage(3);
                      setState(() {
                        selectedPage = 3;
                      });
                      break;
                    case 4:
                      _myPage.jumpToPage(4);
                      setState(() {
                        selectedPage = 4;
                      });
                      break;
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
