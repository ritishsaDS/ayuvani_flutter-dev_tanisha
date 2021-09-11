import 'package:flutter/cupertino.dart';

class RegimePackageModel {
  String aboutPackage;
  List<String> listOfPoints;

  RegimePackageModel(
      {@required this.aboutPackage, @required this.listOfPoints});

  // temp data
  static String packageParagrap =
      'A   Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum ';

  static List<String> packageAboutTempData = [
    'A   Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum '
        'B  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum labor'
        'C  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum labor'
        'C  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum labor'
        'D  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum labor'
        'E  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum labor'
        'G  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum labor'
        'H  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum labor'
        'I  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum labor'
        'J  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum labor'
  ];

  static List<String> packagePointsTempData = [
    'A  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel '
        'B Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas '
        'C  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas '
        'D  Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas '
        'E Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas '
  ];
}
