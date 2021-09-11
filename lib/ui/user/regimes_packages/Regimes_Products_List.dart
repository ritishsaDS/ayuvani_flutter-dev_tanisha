import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';

import '../../../constant/AppColors.dart';
import '../../../models/RegimePackageListModel.dart';
import 'RegimePackageDetails.dart';
import 'Regimes_Doctor_Appointment_Booking.dart';

class RegimesProductList extends StatelessWidget {
  static final route = 'RegimesProductList';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 5.0),
              child: Column(
                children: [
                  Text(
                    'Regimes',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 6,
                        color: apptextcolor,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Appointment Bookings',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 6,
                        color: apptextcolor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 2,
                  right: SizeConfig.blockSizeHorizontal * 2,
                  bottom: SizeConfig.blockSizeHorizontal * 5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 2.2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20),
              itemCount: RegimePackageListModel.cardiacTempData.length,
              itemBuilder: (context, index) {
                return regimesCard(index, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget regimesCard(int count, BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5.0,
          child: Column(
            children: [
              Image.asset(
                RegimePackageListModel.cardiacTempData[count].imageOfPackge,
                height: SizeConfig.blockSizeHorizontal * 25,
                width: 180.0,
              ),
              Padding(
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
                child: Text(
                  RegimePackageListModel.cardiacTempData[count].nameOfPackage,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegimePackageDetails.route,
                      arguments: count);
                },
                child: Text(
                  'Learn More',
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 5)),
                  backgroundColor: MaterialStateProperty.all(appColorPrimary),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 5)),
                  backgroundColor: MaterialStateProperty.all(appColorPrimary),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              RegimesDoctorAppointmentBooking()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
