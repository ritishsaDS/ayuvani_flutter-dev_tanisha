import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/models/MedicalStoreModel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalStore extends StatelessWidget {
  static const route = '/MedicalStore';

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
            'Medicine Store',
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
                itemCount: tempDataForMedicalStore.length,
                itemBuilder: (context, index) {
                  return medicalStoreCard(index);
                }),
          )
        ],
      ),
    );
  }

  medicalStoreCard(int index) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        tempDataForMedicalStore[index].imageUrl,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tempDataForMedicalStore[index].name,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: textSizeNormal,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      tempDataForMedicalStore[index].address,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: textSizeMedium,
                          color: apptextcolor,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: tempDataForMedicalStore[index].ratingStar,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 20,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) => null,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 40,
            height: 140,
            decoration: BoxDecoration(
              color: appColorPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Center(
              child: RotatedBox(
                quarterTurns: 5,
                child: Text(
                  'Order Now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textSizeMedium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
