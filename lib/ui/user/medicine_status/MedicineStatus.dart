import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineStatus extends StatelessWidget {
  static const route = '/MedicalStatus';
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
            'Medicine Status',
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
                  return medicineStatusCard();
                }),
          )
        ],
      ),
    );
  }

  medicineStatusCard() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      elevation: 3,
      child: ExpansionTile(
        leading: Image.asset(
          'assets/medical_status_box.png',
          width: 30,
          height: 30,
        ),
        title: Text(
          'Pain Relief Medicine',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 4,
                color: apptextcolor,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w500),
          ),
        ),
        children: [
          Container(
            color: apptextcolor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Origin',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Text(
                        'Delhi',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: SizeConfig.blockSizeHorizontal * 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Destinition',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Text(
                        'Punjab',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Estimated delivary time',
                  style:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3),
                ),
                Text(
                  '31 March',
                  style:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "27 March",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        Text(
                          "11:30 AM",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                      ],
                    ),
                    Text(
                      "Recieved",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                    Text(
                      "Shipped",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                    Column(
                      children: [
                        Text(
                          "27 March",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        Text(
                          "11:30 AM",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "27 March",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        Text(
                          "11:30 AM",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                      ],
                    ),
                    Text(
                      "Recieved",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                    Text(
                      "Shipped",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                    Column(
                      children: [
                        Text(
                          "27 March",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        Text(
                          "11:30 AM",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "27 March",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        Text(
                          "11:30 AM",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                      ],
                    ),
                    Text(
                      "Recieved",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                    Text(
                      "Shipped",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                    Column(
                      children: [
                        Text(
                          "27 March",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        Text(
                          "11:30 AM",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "27 March",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        Text(
                          "11:30 AM",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                      ],
                    ),
                    Text(
                      "Recieved",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                    Text(
                      "Shipped",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3),
                    ),
                    Column(
                      children: [
                        Text(
                          "27 March",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                        Text(
                          "11:30 AM",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
