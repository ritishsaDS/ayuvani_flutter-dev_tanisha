import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';

import 'chemist_bottom_bar.dart';

class HistoryDetail extends StatefulWidget {
  @override
  _HistoryDetailState createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Stack(children: [
                  GestureDetector(
                      child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/tile.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sharma Chemist",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: textSizeLarge,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Homeopathy",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: textSizeMedium),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Container(
                                        height: 100,
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Shop No. 32\n77 Garry Street\nNew Delhi,India",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: textSizeSMedium,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ))),
                  Container(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 150,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Invoice For",
                                        style: TextStyle(color: apptextcolor),
                                      ),
                                      Text(
                                        "SATISH KUMAR",
                                        style: TextStyle(
                                            color: appTextColorSecondary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: textSizeLargeMedium),
                                      ),
                                      Text(
                                        "House No. 77,Ganga Nagar\nChandigarh , India",
                                        style: TextStyle(
                                            color: appTextColorSecondary),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Amount",
                                        style: TextStyle(color: apptextcolor),
                                      ),
                                      Text(
                                        "1,400",
                                        style: TextStyle(
                                            color: apptextcolor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: textSizeLargeMedium),
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
                                              fontSize: 10),
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
              ),
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
      bottomNavigationBar: ChemistBottomNav(2, true),
    );
  }
}
