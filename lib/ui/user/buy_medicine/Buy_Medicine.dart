import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/PresciptionMedicine.dart';
import 'BuyMedicine_Princing.dart';

class BuyMedicine extends StatelessWidget {
  static const route = '/BuyMedicine';
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
            'Buy Medicine',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  color: apptextcolor,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Prescription',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: appTextColorSecondary,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: PrescriptionMedicine.tempPrescription.length,
                itemBuilder: (context, index) {
                  return listOfPercritionMedicine(index, context);
                }),
          ),
        ],
      ),
    );
  }

  listOfPercritionMedicine(int count, BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              PrescriptionMedicine.tempPrescription[count].nameOfMedicine,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    color: apptextcolor,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuyMedicinePicing()));
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20)),
                    backgroundColor:
                        MaterialStateProperty.all(appColorPrimary)),
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: textSizeMedium,
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
