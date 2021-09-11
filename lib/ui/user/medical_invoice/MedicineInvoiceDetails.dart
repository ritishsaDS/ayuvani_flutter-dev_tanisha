import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';

class MedicineInvoiceDetails extends StatelessWidget {
  static const route = '/MedicineInvoiceDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Stack(children: [
                Image.asset('assets/top bg.png'),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: BackButton(
                    color: Colors.white,
                  ),
                ),
                Positioned.fill(
                  top: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sharma Chemist",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 4,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Homeopathy",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 3),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Invoice Number',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 2.5),
                                ),
                                Text(
                                  '121818-0001',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 3.5),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                        Container(
                          height: 200,
                          width: 2,
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shop No. 32 77 Garry\nStreet New Delhi,India",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.blockSizeHorizontal * 3),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/download icon.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/share icon.png',
                                  height: 20,
                                  width: 20,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      width: double.infinity,
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: Card(
                          elevation: 4,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Invoice For",
                                      style: TextStyle(
                                          color: apptextcolor,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                    ),
                                    Text(
                                      "SATISH KUMAR",
                                      style: TextStyle(
                                          color: appTextColorSecondary,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  4),
                                    ),
                                    Text(
                                      "House No. 77,Ganga Nagar\nChandigarh , India",
                                      style: TextStyle(
                                          color: appTextColorSecondary,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amount",
                                      style: TextStyle(
                                          color: apptextcolor,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  3),
                                    ),
                                    Text(
                                      "1,400",
                                      style: TextStyle(
                                          color: apptextcolor,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  4),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: apptextcolor),
                                      child: Text(
                                        "Payment Successful",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.blockSizeHorizontal *
                                                    3),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ))
                // onTap: () => Navigator.pop(context)),
              ]),
              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Item"),
                        Expanded(child: SizedBox()),
                        Text("Rate"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Qty."),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Price"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Paracetamol tablets 150mg",
                          style: TextStyle(
                            color: appTextColorSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "50",
                          style: TextStyle(
                              color: appTextColorSecondary,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "50",
                          style: TextStyle(
                              color: appTextColorSecondary,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "1000",
                          style: TextStyle(
                              color: appTextColorSecondary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Paracetamol tablets 150mg",
                          style: TextStyle(
                              color: appTextColorSecondary,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "50",
                          style: TextStyle(
                              color: appTextColorSecondary,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "50",
                          style: TextStyle(
                              color: appTextColorSecondary,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "1000",
                          style: TextStyle(
                              color: appTextColorSecondary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      child: Divider(
                        height: 30,
                        thickness: 1,
                        color: apptextcolor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
