import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MainChatScreen.dart';

class ChatListScreen extends StatelessWidget {
  static const route = '/ChatListScreen';
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
            'Chat',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  color: apptextcolor,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return chatListCard(index, context);
                }),
          )
        ],
      ),
    );
  }

  chatListCard(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MainChatScreen.route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            SampleProfileImageUrl,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Abhinash',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Dentist',
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: appColorPrimary,
                      size: SizeConfig.blockSizeHorizontal * 5.5,
                    )
                  ],
                ),
              ),
            ),
            index == 0
                ? Container()
                : Positioned(
                    right: 0,
                    top: -6,
                    child: Container(
                      alignment: Alignment.center,
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: appColorPrimary,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        '+$index',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
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
