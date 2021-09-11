import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

import 'blogdetails_screen.dart';

class BlogScreen extends StatelessWidget {
  static const route = '/BlogScreen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return blogCard(context);
              },
            ),
          )
        ],
      ),
    );
  }

  blogCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BlogDetailsScreen.route);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 2,
            vertical: SizeConfig.blockSizeVertical * 1),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                ),
              ]),
          height: SizeConfig.screenHeight * 0.12,
          child: Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: SizeConfig.blockSizeHorizontal * 6,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 0.3),
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        "Blog",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: SizeConfig.blockSizeVertical * 1.75),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth * 0.85,
                  margin: EdgeInsets.all(SizeConfig.screenWidth * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title",
                          style: TextStyle(
                              color: apptextcolor,
                              fontSize: SizeConfig.blockSizeVertical * 1.80,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans')),
                      Container(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur elit sed do eiusmod tempor incididunt ut in reprehenderit in   cillum dolore .",
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: apptextcolor,
                              fontSize: SizeConfig.blockSizeVertical * 1.70,
                              fontFamily: 'OpenSans'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
