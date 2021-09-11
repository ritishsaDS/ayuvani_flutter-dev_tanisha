import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCompletedScreen extends StatelessWidget {
  static const route = '/PaymentCompletedScreen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/payment top bg.png'),
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
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 8),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/tick icon.png',
                    width: SizeConfig.blockSizeHorizontal * 30,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 25),
                  alignment: Alignment.center,
                  child: Text(
                    'Payment Sucessful',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: textSizeLarge,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Receipt',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: SizeConfig.blockSizeVertical * 3,
                color: appColorPrimary,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 9),
              child: Material(
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/pink email.png',
                            width: SizeConfig.blockSizeHorizontal * 12,
                            height: SizeConfig.blockSizeVertical * 5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                              color: appColorPrimary,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/sms icon.png',
                            width: SizeConfig.blockSizeHorizontal * 12,
                            height: SizeConfig.blockSizeVertical * 5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'SMS',
                            style: TextStyle(
                              color: appColorPrimary,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/print icon.png',
                            width: SizeConfig.blockSizeHorizontal * 12,
                            height: SizeConfig.blockSizeVertical * 5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Print',
                            style: TextStyle(
                              color: appColorPrimary,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 25,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(appColorPrimary),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 20,
                        vertical: SizeConfig.blockSizeVertical * 2))),
                onPressed: () {},
                child: Text(
                  'Download',
                  style: TextStyle(fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
