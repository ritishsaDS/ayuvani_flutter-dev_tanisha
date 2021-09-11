import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/models/RegimePackageModel.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/AppColors.dart';
import '../../../constant/AppConstant.dart';
import '../../../models/RegimePackageListModel.dart';
import '../../../utils/SizeConfig.dart';
import 'Regimes_Doctor_Appointment_Booking.dart';

class RegimePackageDetails extends StatefulWidget {
  static final route = '/RegimePackageDetails';
  @override
  _RegimePackageDetailsState createState() => _RegimePackageDetailsState();
}

class _RegimePackageDetailsState extends State<RegimePackageDetails> {
  @override
  Widget build(BuildContext context) {
    int count = ModalRoute.of(context).settings.arguments;
    print(count);
    SizeConfig().init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  RegimePackageListModel.cardiacTempData[count].imageOfPackge,
                  width: SizeConfig.screenWidth,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: BackButton(
                      color: appColorPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Package',
                    style: TextStyle(
                        color: apptextcolor,
                        fontSize: textSizeLarge,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    RegimePackageModel.packageParagrap,
                    // 'Google',
                    style: TextStyle(
                      fontSize: textSizeNormal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minWidth: SizeConfig.blockSizeHorizontal * 70,
                color: appColorPrimary,
                onPressed: () {
                  Navigator.pushNamed(
                      context, RegimesDoctorAppointmentBooking.route);
                },
                child: Text(
                  'Next',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: textSizeLargeMedium,
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
