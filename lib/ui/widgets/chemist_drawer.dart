import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/ui/chemist/login/Login_Screen_Chemist.dart';
import 'package:flutter_ayuvani/ui/chemist/login/bloc/chemist_login_bloc.dart';
import 'package:flutter_ayuvani/ui/user/PrescriptionScreen.dart';
import 'package:flutter_ayuvani/ui/user/UserProfile.dart';
import 'package:flutter_ayuvani/ui/user/medicine_store/medical_store.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChemistDrawer extends StatefulWidget {
  @override
  _ChemistDrawerState createState() => _ChemistDrawerState();
}

class _ChemistDrawerState extends State<ChemistDrawer> {
  @override
  Widget build(BuildContext context) {
    final profileData =
        context.watch<ChemistLoginBloc>().chemistLoginModel.data;

    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // CircleAvatar(
                      //   radius: SizeConfig.blockSizeHorizontal * 10,
                      //   backgroundImage: NetworkImage(SampleProfileImageUrl),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Hi, ${profileData.name}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeHorizontal * 4,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${profileData.email}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeHorizontal * 3,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // GestureDetector(
                          //     onTap: () {
                          //       Navigator.of(context).pop();
                          //
                          //       Navigator.pushNamed(
                          //           context, ProfileScreen.route);
                          //     },
                          //     child: Text(
                          //       'View Profile',
                          //       style: TextStyle(
                          //         color: appColorPrimary,
                          //         fontWeight: FontWeight.w600,
                          //         fontSize: textSizeSMedium,
                          //       ),
                          //     ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 5,
                    color: appColorPrimary,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        color: appColorPrimary, fontWeight: FontWeight.w700),
                  ),
                  leading: Icon(
                    Icons.person_rounded,
                    color: appColorPrimary,
                  ),
                  // Image.asset(
                  //   "assets/cart 2.png",
                  //   height: 30,
                  //   width: 30,
                  // ),
                  onTap: () {
                    // Update the state of the app
                    Navigator.pop(context);
                    Navigator.pushNamed(context, UserProfile.route);
                  },
                ),
                ListTile(
                  title: Text(
                    'Medical Store',
                    style: TextStyle(
                        color: appColorPrimary, fontWeight: FontWeight.w700),
                  ),
                  leading: Image.asset(
                    "assets/medical_status_box.png",
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.pushNamed(context, MedicalStore.route);
                  },
                ),
                ListTile(
                  title: Text(
                    'Prescription',
                    style: TextStyle(
                        color: appColorPrimary, fontWeight: FontWeight.w700),
                  ),
                  leading: Image.asset(
                    "assets/pink prescription icon.png",
                    height: 30,
                    width: 30,
                  ),
                  // trailing: notificationCount(count: 3),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                    Navigator.pushNamed(context, PrescriptionScreen.route);
                  },
                ),
                // ListTile(
                //   title: Text(
                //     'Notification',
                //     style: TextStyle(
                //         color: appColorPrimary, fontWeight: FontWeight.w700),
                //   ),
                //   leading: Image.asset(
                //     "assets/notification.png",
                //     height: 30,
                //     width: 30,
                //   ),
                //   trailing: notificationCount(count: 1),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //
                //     Navigator.pushNamed(context, NotificationScreen.route);
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    height: 5,
                    color: appColorPrimary,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Rate',
                    style: TextStyle(
                      color: appColorPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: appColorPrimary, fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ChemistLoginScreen.route);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  notificationCount({int count}) {
    return Container(
      height: 50,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: appColorPrimary.withOpacity(0.8)),
      child: Text(
        count.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
