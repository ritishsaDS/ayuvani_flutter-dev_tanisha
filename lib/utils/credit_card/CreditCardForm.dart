import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'CreditCard.dart';
import 'CreditCardModel.dart';
import 'package:async/async.dart';


bool iscardnumberempty=false;

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({
    Key key,
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
    this.onCreditCardModelChange,
    this.themeColor,
    this.textColor = Colors.black,
    this.cursorColor,
    this.iscard,
  }) : super(key: key,);

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final void Function(CreditCardModel) onCreditCardModelChange;
  final Color themeColor;
  final Color textColor;
  final Color cursorColor;
  final bool iscard;

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  bool isCvvFocused = false;
  Color themeColor;
  var focus=FocusNode();
  var cvvfocus=FocusNode();
  var namefocus=FocusNode();

  void Function(CreditCardModel) onCreditCardModelChange;
  CreditCardModel creditCardModel;

  final MaskedTextController _cardNumberController = Platform.isAndroid?MaskedTextController(mask: '0000 0000 0000 0000'):MaskedTextController(mask: '0000000000000000');
  final TextEditingController _expiryDateController =
  TextEditingController();
  final TextEditingController _cardHolderNameController =
  TextEditingController();
  final TextEditingController _cvvCodeController =
  MaskedTextController(mask: '0000');
  Timer _debounce;

  FocusNode cvvFocusNode = FocusNode();

  void textFieldFocusDidChange() {
    creditCardModel.isCvvFocused = cvvFocusNode.hasFocus;
    onCreditCardModelChange(creditCardModel);
  }

  void createCreditCardModel() {
    cardNumber = widget.cardNumber ?? '';
    expiryDate = widget.expiryDate ?? '';
    cardHolderName = widget.cardHolderName ?? '';
    cvvCode = widget.cvvCode ?? '';
    creditCardModel = CreditCardModel(
        cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused);
  }
  @override
  void initState() {
    super.initState();
   /* print(iscardnumber);
    print("ddd");
    print(widget.iscard);*/
    createCreditCardModel();

    onCreditCardModelChange = widget.onCreditCardModelChange;

    cvvFocusNode.addListener(textFieldFocusDidChange);

    _cardNumberController.addListener(() {
      setState(() {
        cardNumber = _cardNumberController.text;
        creditCardModel.cardNumber = cardNumber;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _expiryDateController.addListener(() {
      setState(() {
        expiryDate = _expiryDateController.text;
        creditCardModel.expiryDate = expiryDate;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cardHolderNameController.addListener(() {
      setState(() {
        cardHolderName = _cardHolderNameController.text;
        creditCardModel.cardHolderName = cardHolderName;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cvvCodeController.addListener(() {
      setState(() {
        cvvCode = _cvvCodeController.text;
        creditCardModel.cvvCode = cvvCode;
        onCreditCardModelChange(creditCardModel);
      });
    });
    _expiryDateController.addListener(_onSearchChanged);

  }

  @override
  void didChangeDependencies() {
    themeColor = widget.themeColor ?? Theme.of(context).primaryColor;
    super.didChangeDependencies();
  }
  final AsyncMemoizer _memoizer = AsyncMemoizer();


  @override
  Widget build(BuildContext context) {

    return Theme(
      data: ThemeData(
        primaryColor: themeColor.withOpacity(0.8),
        primaryColorDark: themeColor,
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                controller: _cardNumberController,
                cursorColor: widget.cursorColor ?? themeColor,
                validator: (value) {
                  if (value == null || value=="") {
                    return "Enter Card Number";
                  }
                },
                onFieldSubmitted: (v){
                  FocusScope.of(context).requestFocus(focus);
                },autofocus: true,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CARD NUMBER",
                  hintText: 'xxxx xxxx xxxx xxxx',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                controller: _expiryDateController,
                cursorColor: widget.cursorColor ?? themeColor,
                focusNode: focus,
                style: TextStyle(
                  color: widget.textColor,
                ),
              /*  onFieldSubmitted: (v){
                  focus.unfocus();
                  FocusScope.of(context).requestFocus(cvvFocusNode);
                },*/

                onChanged: (value)
                {
               /*   _expiryDateController.value = TextEditingValue(
                    text: value,
                    selection: TextSelection.collapsed(offset: value.length),
                  );*/
                  print(value);
                  if (_debounce?.isActive ?? false) _debounce.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    // do something with _searchQuery.text
                    if(value.length == 2){

                      var valueNew = _expiryDateController.text + "/";
                      _expiryDateController.value = TextEditingValue(
                        text: valueNew,
                        selection: TextSelection.collapsed(offset: valueNew.length),
                      );

                    }
                  });
                 /* if(value.length == 2){

                  var valueNew = _expiryDateController.text + "/";
                  _expiryDateController.value = TextEditingValue(
                    text: valueNew,
                    selection: TextSelection.collapsed(offset: valueNew.length),
                  );

                  }*/
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "EXPIRY DATE",
                    hintText: 'MM/YY'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                focusNode: cvvFocusNode,
                controller: _cvvCodeController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CVV",
                  hintText: 'XXXX',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v){
                  cvvFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(namefocus);
                },
                onChanged: (String text) {
                  setState(() {
                    cvvCode = text;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                focusNode: namefocus,
                controller: _cardHolderNameController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CARD HOLDER",
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ),


          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _expiryDateController.removeListener(_onSearchChanged);
    _expiryDateController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

    _onSearchChanged() {
      if (_debounce?.isActive ?? false) _debounce.cancel();
      _debounce = Timer(const Duration(milliseconds: 100), () {
        // do something with _searchQuery.text
        if(_expiryDateController.text.length == 2){

          var valueNew = _expiryDateController.text + "/";
          _expiryDateController.value = TextEditingValue(
            text: valueNew,
            selection: TextSelection.collapsed(offset: valueNew.length),
          );

        }
      });
    }


}
