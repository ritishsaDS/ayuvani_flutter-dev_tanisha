import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/models/doctor_model.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ServiceWise_Booking.dart';

class ServiceDoctorList extends StatefulWidget {
  static final route = '/DoctorSelection';

  @override
  _ServiceDoctorListState createState() => _ServiceDoctorListState();
}

class _ServiceDoctorListState extends State<ServiceDoctorList> {
  final key = new GlobalKey<ScaffoldState>();

  final TextEditingController _searchQuery = new TextEditingController();

  bool _IsSearching;

  String _searchText = "";

  DoctorModel doctorModel;

  double experinceSlider = 1;

  List<String> _locations = ['Experience', 'A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation;

  getDropDownValue(String value) {
    setState(() {
      _selectedLocation = value;
    });
  }

  final colorServiceWise = [
    ayurvadicGreen,
    yogaBlue,
    unaniPurple,
    siddhaOrange,
    sowaPink,
    homeopathyPeach
  ];

  @override
  Widget build(BuildContext context) {
    int indexColor = ModalRoute.of(context).settings.arguments;
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
            'Ayurveda',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  color: colorServiceWise[indexColor],
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,
                          color: colorServiceWise[indexColor]),
                      hintText: "Search",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: colorServiceWise[indexColor], width: 2.0),
                      ),
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: DropdownButton<String>(
                  hint: Text('Select ...'),
                  value: _selectedLocation,
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  items: _locations.map((listValue) {
                    return DropdownMenuItem(
                      value: listValue,
                      child: Center(child: Text(listValue)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    getDropDownValue(value);
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Slider(
                  activeColor: colorServiceWise[indexColor],
                  inactiveColor: colorServiceWise[indexColor],
                  value: experinceSlider,
                  onChanged: (value) {
                    setState(() {
                      experinceSlider = value;
                    });
                  },
                  divisions: 10,
                  label: '${experinceSlider.round()} yr.',
                  min: 0,
                  max: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('0 yr.'),
                    Text('20 yr.'),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return doctorListCard(context, indexColor);
              },
            ),
          ),
        ],
      ),
    );
  }

  doctorListCard(BuildContext context, int indexColor) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SeviceWiseBooking.route,
            arguments: indexColor);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 1, vertical: 10),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10),
          elevation: 5,
          child: Stack(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        SampleProfileImageUrl,
                        height: SizeConfig.blockSizeHorizontal * 25,
                        width: SizeConfig.blockSizeHorizontal * 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Avinash',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3.5,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            'Dentist',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 3,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Exp  ',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '5 Year',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3.5,
                                  color: colorServiceWise[indexColor],
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Fees',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 3),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '₹ 1000',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3.5,
                                  color: colorServiceWise[indexColor],
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Rating',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 3),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: SizeConfig.blockSizeHorizontal * 4,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            '4.5',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3.5,
                                  color: colorServiceWise[indexColor],
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text('About'),
                      //     // Text(
                      //     //   LoremText,
                      //     // ),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(
                    width: 32,
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeHorizontal * 5.6,
                    horizontal: SizeConfig.blockSizeHorizontal * 2.5,
                  ),
                  decoration: BoxDecoration(
                    color: colorServiceWise[indexColor],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 5,
                      child: Text(
                        'Book Now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Card doctorListCard(Color colorServiceWise[indexColor]) {
  //   return Card(
  //     margin: EdgeInsets.symmetric(horizontal: 10),
  //     elevation: 5,
  //     child: Row(
  //       // mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10),
  //             child: Image.network(
  //               SampleProfileImageUrl,
  //               height: 120,
  //               width: 120,
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Dr. Avinash',
  //                   style: GoogleFonts.poppins(
  //                     textStyle: TextStyle(
  //                         fontSize: textSizeNormal,
  //                         fontFamily: 'OpenSans',
  //                         fontWeight: FontWeight.w600),
  //                   ),
  //                 ),
  //                 Text(
  //                   'Dentist',
  //                   style: GoogleFonts.poppins(
  //                     textStyle: TextStyle(
  //                         fontSize: textSizeSMedium,
  //                         fontFamily: 'OpenSans',
  //                         fontWeight: FontWeight.w600),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 3,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text('Exp  '),
  //                 SizedBox(
  //                   width: 30,
  //                 ),
  //                 Text(
  //                   '5 Year',
  //                   style: GoogleFonts.poppins(
  //                     textStyle: TextStyle(
  //                         fontSize: textSizeMedium,
  //                         color: colorServiceWise[indexColor],
  //                         fontFamily: 'OpenSans',
  //                         fontWeight: FontWeight.w500),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 2,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text('Fees'),
  //                 SizedBox(
  //                   width: 30,
  //                 ),
  //                 Text(
  //                   '₹ 1000',
  //                   style: GoogleFonts.poppins(
  //                     textStyle: TextStyle(
  //                         fontSize: textSizeMedium,
  //                         color: colorServiceWise[indexColor],
  //                         fontFamily: 'OpenSans',
  //                         fontWeight: FontWeight.w500),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 2,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text('Rating'),
  //                 SizedBox(
  //                   width: 15,
  //                 ),
  //                 Icon(
  //                   Icons.star,
  //                   color: Colors.amber,
  //                   size: 20,
  //                 ),
  //                 SizedBox(
  //                   width: 3,
  //                 ),
  //                 Text(
  //                   '4.5',
  //                   style: GoogleFonts.poppins(
  //                     textStyle: TextStyle(
  //                         fontSize: textSizeMedium,
  //                         color: colorServiceWise[indexColor],
  //                         fontFamily: 'OpenSans',
  //                         fontWeight: FontWeight.w500),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             // SizedBox(
  //             //   height: 10,
  //             // ),
  //             // Column(
  //             //   crossAxisAlignment: CrossAxisAlignment.start,
  //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             //   children: [
  //             //     Text('About'),
  //             //     // Text(
  //             //     //   LoremText,
  //             //     // ),
  //             //   ],
  //             // ),
  //           ],
  //         ),
  //         SizedBox(
  //           width: 32,
  //         ),
  //         Container(
  //           width: 40,
  //           height: 137,
  //           decoration: BoxDecoration(
  //             color: colorServiceWise[indexColor],
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20),
  //               bottomLeft: Radius.circular(20),
  //             ),
  //           ),
  //           child: Center(
  //             child: RotatedBox(
  //               quarterTurns: 5,
  //               child: Text(
  //                 'Book Now',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: textSizeMedium,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         // Transform.rotate(
  //         //   angle: -300,
  //         //   child: ElevatedButton(
  //         //     style: ButtonStyle(
  //         //       shape: MaterialStateProperty.all<
  //         //           RoundedRectangleBorder>(
  //         //         RoundedRectangleBorder(
  //         //           borderRadius: BorderRadius.only(
  //         //             bottomLeft: Radius.circular(10),
  //         //             bottomRight: Radius.circular(10),
  //         //           ),
  //         //         ),
  //         //       ),
  //         //     ),
  //         //     onPressed: () {
  //         //       Navigator.push(
  //         //           context,
  //         //           MaterialPageRoute(
  //         //               builder: (context) => PaymentScreen()));
  //         //     },
  //         //     child: Text(
  //         //       'Book Now',
  //         //       style: TextStyle(
  //         //           color: Colors.white, fontSize: textSizeMedium),
  //         //     ),
  //         //   ),
  //         // ),
  //       ],
  //     ),
  //   );
  // }

  //todo: add drop down menu
  dropDownForExperience() {
    return Row(
      children: [],
    );
  }
}
