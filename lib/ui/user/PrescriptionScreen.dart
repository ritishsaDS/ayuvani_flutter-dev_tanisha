import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:google_fonts/google_fonts.dart';

class PrescriptionScreen extends StatelessWidget {
  static const route = '/PrescriptionScreen';

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
          'Prescription',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: textSizeLarge,
                color: apptextcolor,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return listTileForPrecriotion();
              }),
        )
      ],
    ));
  }

  listTileForPrecriotion() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Text('Prescriotion Drug Addiction'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
