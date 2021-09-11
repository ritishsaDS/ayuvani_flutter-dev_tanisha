import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Color cdButtonColor = Colors.white;
  Color internetButtonColor = Colors.white;
  Color walletButtonColor = Colors.white;
  Color cdTextColor = Colors.grey;
  Color internetTextColor = Colors.grey;
  Color walletTextColor = Colors.grey;

  bool saveCheckbox = false;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  FocusNode cardNumberFocusNode;
  FocusNode cvvFocusNode;
  FocusNode monthFocusNode;
  FocusNode holderFocusNode;
  FocusNode mobileFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardNumberFocusNode = FocusNode();
    cvvFocusNode = FocusNode();
    monthFocusNode = FocusNode();
    holderFocusNode = FocusNode();
    mobileFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cardNumberFocusNode.dispose();
    cvvFocusNode.dispose();
    mobileFocusNode.dispose();
    holderFocusNode.dispose();
    mobileFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.1,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/topshapeicon.png',
                          ),
                          fit: BoxFit.fill)),
                  child: BackButton(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Payment",
                  style: TextStyle(
                    color: apptextcolor,
                    fontSize: SizeConfig.blockSizeVertical * 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(1.0),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.04,
                  margin: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.05,
                      bottom: SizeConfig.screenHeight * 0.05,
                      left: SizeConfig.screenWidth * 0.01,
                      right: SizeConfig.screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            cdButtonColor = appColorPrimary;
                            cdTextColor = Colors.white;
                            internetButtonColor = Colors.white;
                            internetTextColor = Colors.grey;
                            walletButtonColor = Colors.white;
                            walletTextColor = Colors.grey;
                          });
                        },
                        child: Text(
                          "Credit/Debit Card",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.40,
                              color: cdTextColor),
                        ),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        color: cdButtonColor,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            internetButtonColor = appColorPrimary;
                            internetTextColor = Colors.white;
                            cdButtonColor = Colors.white;
                            cdTextColor = Colors.grey;
                            walletButtonColor = Colors.white;
                            walletTextColor = Colors.grey;
                          });
                        },
                        child: Text(
                          "Internet Banking",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.40,
                              color: internetTextColor),
                        ),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        color: internetButtonColor,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            walletButtonColor = appColorPrimary;
                            walletTextColor = Colors.white;
                            cdButtonColor = Colors.white;
                            cdTextColor = Colors.grey;
                            internetButtonColor = Colors.white;
                            internetTextColor = Colors.grey;
                          });
                        },
                        child: Text(
                          "UPI / Wallet",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.40,
                              color: walletTextColor),
                        ),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        color: walletButtonColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.screenHeight * 0.06,
                  width: SizeConfig.screenWidth,
                  margin: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.05,
                    right: SizeConfig.screenWidth * 0.05,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                          offset: Offset(0, 0))
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(image: AssetImage('assets/visa.png')),
                      Image(image: AssetImage('assets/mastercard.png')),
                      Image(image: AssetImage('assets/americanexpress.png')),
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.screenHeight * 0.50,
                  width: SizeConfig.screenWidth,
                  margin: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.05,
                      right: SizeConfig.screenWidth * 0.05,
                      top: SizeConfig.screenHeight * 0.03,
                      bottom: SizeConfig.screenHeight * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                          offset: Offset(0, 0))
                    ],
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Container(
                          padding:
                              EdgeInsets.all(SizeConfig.screenWidth * 0.03),
                          child: Text(
                            "Card Detail",
                            style: TextStyle(
                                color: apptextcolor,
                                fontWeight: FontWeight.bold),
                          )),
                      Form(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.screenWidth * 0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text("Card Number")),
                                TextFormField(
                                  controller: cardNumberController,
                                  focusNode: cardNumberFocusNode,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: appColorPrimary,
                                            style: BorderStyle.solid,
                                            width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: appColorPrimary,
                                            style: BorderStyle.solid,
                                            width: 1.0)),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appColorPrimary,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appColorPrimary,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                    ),
                                  ),
                                  onFieldSubmitted: (term) {
                                    cardNumberFocusNode.unfocus();
                                    FocusScope.of(context)
                                        .requestFocus(cvvFocusNode);
                                  },
                                )
                              ],
                            ),
                            padding: EdgeInsets.all(8.0),
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text("CVV")),
                                    Container(
                                      width: SizeConfig.screenHeight * 0.15,
                                      child: TextFormField(
                                        controller: cvvController,
                                        focusNode: cvvFocusNode,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(5),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: appColorPrimary,
                                                  style: BorderStyle.solid,
                                                  width: 1.0)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: appColorPrimary,
                                                  style: BorderStyle.solid,
                                                  width: 1.0)),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: appColorPrimary,
                                                style: BorderStyle.solid,
                                                width: 1.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: appColorPrimary,
                                                style: BorderStyle.solid,
                                                width: 1.0),
                                          ),
                                        ),
                                        onFieldSubmitted: (term) {
                                          cvvFocusNode.unfocus();
                                          FocusScope.of(context)
                                              .requestFocus(monthFocusNode);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text("Month/Year")),
                                    Container(
                                      width: SizeConfig.screenHeight * 0.15,
                                      child: TextFormField(
                                        controller: monthController,
                                        focusNode: monthFocusNode,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(5),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: appColorPrimary,
                                                  style: BorderStyle.solid,
                                                  width: 1.0)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: appColorPrimary,
                                                  style: BorderStyle.solid,
                                                  width: 1.0)),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: appColorPrimary,
                                                style: BorderStyle.solid,
                                                width: 1.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: appColorPrimary,
                                                style: BorderStyle.solid,
                                                width: 1.0),
                                          ),
                                        ),
                                        onFieldSubmitted: (term) {
                                          monthFocusNode.unfocus();
                                          FocusScope.of(context)
                                              .requestFocus(holderFocusNode);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text("Card Holder Name")),
                                TextFormField(
                                  controller: cardHolderController,
                                  focusNode: holderFocusNode,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: appColorPrimary,
                                            style: BorderStyle.solid,
                                            width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: appColorPrimary,
                                            style: BorderStyle.solid,
                                            width: 1.0)),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appColorPrimary,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appColorPrimary,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                    ),
                                  ),
                                  onFieldSubmitted: (term) {
                                    holderFocusNode.unfocus();
                                    FocusScope.of(context)
                                        .requestFocus(mobileFocusNode);
                                  },
                                )
                              ],
                            ),
                            padding: EdgeInsets.all(8.0),
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text("Mobile Number")),
                                TextFormField(
                                  controller: mobileNumberController,
                                  focusNode: mobileFocusNode,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: appColorPrimary,
                                            style: BorderStyle.solid,
                                            width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: appColorPrimary,
                                            style: BorderStyle.solid,
                                            width: 1.0)),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appColorPrimary,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appColorPrimary,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                    ),
                                  ),
                                  onFieldSubmitted: (term) {
                                    mobileFocusNode.unfocus();
                                  },
                                )
                              ],
                            ),
                            padding: EdgeInsets.all(8.0),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth * 0.12),
                      child: Checkbox(
                        value: saveCheckbox,
                        fillColor: MaterialStateProperty.all(appColorPrimary),
                        activeColor: appColorPrimary,
                        onChanged: (bool value) {
                          setState(() {
                            saveCheckbox = value;
                          });
                        },
                        checkColor: Colors.white,
                      ),
                    ),
                    Text("Save Card Info"),
                  ],
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  margin: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.05,
                      right: SizeConfig.screenWidth * 0.05),
                  child: MaterialButton(
                    onPressed: () {},
                    color: appColorPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(
                                left: SizeConfig.screenWidth * 0.03),
                            child: Text(
                              "Pay Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      SizeConfig.blockSizeVertical * 2.75),
                            )),
                        Container(
                          height: SizeConfig.screenHeight * 0.035,
                          width: SizeConfig.screenWidth * 0.3,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            "Total - \$100",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: apptextcolor),
                          ),
                        )
                      ],
                    ),
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
