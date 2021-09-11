import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogDetailsScreen extends StatelessWidget {
  static const route = '/BlogDetailsScreen';
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
            'Blog',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: textSizeLarge,
                  color: apptextcolor,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: null,
                    child: Text(
                      'Title',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(apptextcolor),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(LoremText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
