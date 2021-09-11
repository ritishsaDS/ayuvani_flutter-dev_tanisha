import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ServiceDoctorList.dart';

class ServiceWise extends StatelessWidget {
  static final route = '/ServiceWise';
  final serviceWise = [
    'Ayurveda',
    'Yoga and Naturopathy',
    'Unani',
    'Siddha',
    'Sowa Rigpa',
    'Homeopathy'
  ];

  final colorServiceWise = [
    ayurvadicGreen,
    yogaBlue,
    unaniPurple,
    siddhaOrange,
    sowaPink,
    homeopathyPeach
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/topshapeicon.png',
                height: 90,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBar(
                  leading: BackButton(
                    color: Colors.white,
                  ),
                  backgroundColor:
                      Colors.transparent, //You can make this transparent
                  elevation: 0.0, //No shadow
                ),
              ),
            ],
          ),
          Text(
            'Service Wise',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  color: ayurvadicGreen,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: serviceWise.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text(
                      serviceWise[index],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            color: colorServiceWise[index],
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: colorServiceWise[index],
                      size: SizeConfig.blockSizeHorizontal * 5,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, ServiceDoctorList.route,
                          arguments: index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  goToNextScreen(BuildContext context, String routeName) {
    return Navigator.pushNamed(context, routeName);
  }
}
