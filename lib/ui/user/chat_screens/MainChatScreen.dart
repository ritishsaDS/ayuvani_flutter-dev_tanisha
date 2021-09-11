import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

class MainChatScreen extends StatefulWidget {
  static const route = '/MainChatScreen';

  @override
  _MainChatScreenState createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  String _doctorName = 'Dr. Avinash';
  String typeOfDoctor = 'Dentist';
  FocusNode chatFocusNode;
  TextEditingController chatController = TextEditingController();

  @override
  void initState() {
    chatFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    chatFocusNode.dispose();
    super.dispose();
  }

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
          Center(
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(SampleProfileImageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _doctorName,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      typeOfDoctor,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                1.0, 1.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.videocam,
                            size: SizeConfig.blockSizeHorizontal * 6,
                            color: appColorPrimary,
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                1.0, 1.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.call,
                            size: SizeConfig.blockSizeHorizontal * 6,
                            color: appColorPrimary,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
      bottomNavigationBar: getTextField(),
    );
  }

  // getChatTextFiled() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10.0),
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey,
  //           offset: Offset(0.0, 1.0), //(x,y)
  //           blurRadius: 6.0,
  //         ),
  //       ],
  //     ),
  //     child: Flexible(
  //       child: ConstrainedBox(
  //         constraints: BoxConstraints(
  //           // minWidth: size.width,
  //           // maxWidth: size.width,
  //           minHeight: 25.0,
  //           maxHeight: 135.0,
  //         ),
  //         child: Scrollbar(
  //           child: TextFormField(
  //             keyboardType: TextInputType.multiline,
  //             autofocus: false,
  //             focusNode: chatFocusNode,
  //             controller: chatController,
  //             textInputAction: TextInputAction.next,
  //             validator: (value) {
  //               if (value.isEmpty) return "This field is required";
  //               return null;
  //             },
  //             decoration: InputDecoration(
  //               isDense: true,
  //               contentPadding:
  //                   EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
  //               fillColor: Colors.white,
  //               hoverColor: Colors.white,
  //               filled: true,
  //               border: OutlineInputBorder(
  //                 borderRadius: const BorderRadius.all(
  //                   const Radius.circular(30.0),
  //                 ),
  //               ),
  //               focusedBorder: InputBorder.none,
  //               enabledBorder: InputBorder.none,
  //               errorBorder: InputBorder.none,
  //               disabledBorder: InputBorder.none,
  //             ),
  //             cursorColor: Color(0XFFFF5379),
  //             onFieldSubmitted: (term) {
  //               chatFocusNode.unfocus();
  //             },
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  getTextField() {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 5.0),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.camera_alt,
                size: SizeConfig.blockSizeHorizontal * 7,
                color: appColorPrimary),
          ),
          SizedBox(width: 5.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.attach_file,
                size: SizeConfig.blockSizeHorizontal * 7,
                color: appColorPrimary),
          ),
          SizedBox(width: 5.0),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.image,
                size: SizeConfig.blockSizeHorizontal * 7,
                color: appColorPrimary),
          ),
          SizedBox(width: 5.0),
        ],
      ),
    );
  }
}
