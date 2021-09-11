import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MedicineInvoiceDetails.dart';

class MedicineInvoiceList extends StatelessWidget {
  static const route = '/MedicineInvoiceList';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
              'Medicine invoice',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: textSizeLarge,
                    color: apptextcolor,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return getListForInvoice(context);
                  }),
            )
          ],
        ),
      ),
    );
  }

  getListForInvoice(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MedicineInvoiceDetails.route);
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3,
            vertical: SizeConfig.blockSizeHorizontal * 3),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 3,
              vertical: SizeConfig.blockSizeHorizontal * 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pain Relief',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontFamily: 'OpenSans',
                ),
              ),
              Text(
                '\$ 1400',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontFamily: 'OpenSans',
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: appColorPrimary,
                size: SizeConfig.blockSizeHorizontal * 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
