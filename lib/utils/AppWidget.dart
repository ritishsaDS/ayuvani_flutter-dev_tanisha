import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:flutter_ayuvani/models/Data.dart';
import 'package:flutter_ayuvani/models/ListModel.dart';
import 'package:flutter_ayuvani/utils/SizeConfig.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';


import '../main.dart';

Widget text(
  String text, {
  var fontSize = textSizeLargeMedium,
  textColor = appTextColorSecondary,
  var fontFamily,
  var isCentered = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
}) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
          lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}

void changeStatusColor(Color color) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }
}

Widget commonCacheImageWidget(
    {double width, BoxFit fit, String url, double height}) {
  if (isMobile) {
    return CachedNetworkImage(
      placeholder: placeholderWidgetFn(),
      imageUrl: '$url',
      height: height,
      width: width,
      fit: fit,
    );
  } else {
    return Image.network(
      url,
      height: height,
      width: width,
      fit: fit,
    );
  }
}

Widget settingItem(context, String text,
    {Function onTap,
    Widget detail,
    Widget leading,
    Color textColor,
    int textSize,
    double padding}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  child: leading ?? SizedBox(),
                  width: 30,
                  alignment: Alignment.center),
              leading != null ? 10.width : SizedBox(),
              Text(text,
                      style: primaryTextStyle(
                          size: textSize ?? 18,
                          color: textColor ?? appStore.textPrimaryColor))
                  .expand(),
            ],
          ).expand(),
          detail ??
              Icon(Icons.arrow_forward_ios,
                  size: 16, color: appStore.textSecondaryColor),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}

Widget appBarTitleWidget(context, String title, {Color color}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    color: color ?? appStore.appBarColor,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: boldTextStyle(color: appStore.textPrimaryColor, size: 20),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

Widget appBar(BuildContext context, String title,
    {List<Widget> actions,
    bool showBack = true,
    Color color,
    Color iconColor,
    bool isleading = false,
    Widget tabBar,
    int size,
    Widget leading}) {
  return AppBar(
    bottom: tabBar,
    brightness: !appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    automaticallyImplyLeading: false,
    backgroundColor: color ?? appStore.appBarColor,
    centerTitle: true,
    leading: showBack
        ? isleading
            ? leading
            : IconButton(
                onPressed: () {
                  finish(context);
                },
                icon: Icon(Icons.arrow_back, color: iconColor ?? null),
              )
        : null,
    title: Text(
      title,
      style: boldTextStyle(
          color: appStore.textPrimaryColor,
          size: size,
          weight: FontWeight.w600),
      maxLines: 1,
      textAlign: TextAlign.center,
    ),
    actions: actions,
  );
}

class ExampleItemWidget extends StatelessWidget {
  final ListModel tabBarType;
  final Function onTap;
  final bool showTrailing;

  ExampleItemWidget(this.tabBarType,
      {@required this.onTap, this.showTrailing = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appStore.appBarColor,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      elevation: 2.0,
      shadowColor: Colors.black,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(tabBarType.name, style: boldTextStyle()),
        trailing: showTrailing
            ? Icon(Icons.arrow_forward_ios,
                size: 15, color: appStore.textPrimaryColor)
            : null,
      ),
    );
  }
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? appStore.scaffoldBackground,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

String convertDate(date) {
  try {
    return date != null
        ? DateFormat(dateFormat).format(DateTime.parse(date))
        : '';
  } catch (e) {
    print(e);
    return '';
  }
}

class CustomTheme extends StatelessWidget {
  final Widget child;

  CustomTheme({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appStore.isDarkModeOn
          ? ThemeData.dark().copyWith(
              accentColor: appColorPrimary,
              backgroundColor: appStore.scaffoldBackground,
            )
          : ThemeData.light(),
      child: child,
    );
  }
}

Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() => CupertinoActivityIndicator(
      radius: 15,
    );

BoxConstraints dynamicBoxConstraints({double maxWidth}) {
  return BoxConstraints(maxWidth: maxWidth ?? applicationMaxWidth);
}

double dynamicWidth(BuildContext context) {
  return isMobile ? context.width() : applicationMaxWidth;
}

/*class ContainerX extends StatelessWidget {
  static String tag = '/ContainerX';
  final BuildContext context;
  final double maxWidth;
  final Widget child;

  ContainerX({@required this.context, this.maxWidth, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: context.height(),
      child: ConstrainedBox(
        constraints: dynamicBoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
      alignment: Alignment.topCenter,
    );
  }
}*/

String getBannerAdUnitId() {
  if (kReleaseMode) {
    if (Platform.isIOS) {
      return bannerAdIdForIos;
    } else if (Platform.isAndroid) {
      return bannerAdIdForAndroidRelease;
    }
  } else {
    if (Platform.isIOS) {
      return bannerAdIdForIos;
    } else if (Platform.isAndroid) {
      return bannerAdIdForAndroid;
    }
  }
  return null;
}

String getInterstitialAdUnitId() {
  if (kReleaseMode) {
    if (Platform.isIOS) {
      return interstitialAdIdForIos;
    } else if (Platform.isAndroid) {
      return InterstitialAdIdForAndroidRelease;
    }
  } else {
    if (Platform.isIOS) {
      return interstitialAdIdForIos;
    } else if (Platform.isAndroid) {
      return InterstitialAdIdForAndroid;
    }
  }
  return null;
}

class ContainerX extends StatelessWidget {
  final Widget mobile;
  final Widget web;
  final bool useFullWidth;

  ContainerX({this.mobile, this.web, this.useFullWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.device == DeviceSize.mobile) {
          return mobile ?? SizedBox();
        } else {
          return Container(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: useFullWidth.validate()
                  ? null
                  : dynamicBoxConstraints(maxWidth: context.width() * 0.9),
              child: web ?? SizedBox(),
            ),
          );
        }
      },
    );
  }
}

Widget divider() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: Divider(
      color: Colors.black12,
    ),
  );
}

class DotIndicator extends StatefulWidget {
  static String tag = '/DotIndicator';
  final List<Widget> pages;
  var selectedIndex = 0;
  Color indicatorColor;
  final Function onDotTap;

  DotIndicator(
      {@required this.pages,
      this.selectedIndex,
      this.indicatorColor,
      this.onDotTap});

  @override
  DotIndicatorState createState() => DotIndicatorState();
}

class DotIndicatorState extends State<DotIndicator> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.pages.asMap().entries.map((entry) {
          int idx = entry.key;
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 10,
            width: widget.selectedIndex == idx ? 20 : 10,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              color: widget.selectedIndex == idx
                  ? widget.indicatorColor ?? white
                  : Colors.transparent,
              border: Border.all(color: widget.indicatorColor ?? viewLineColor),
            ),
          ).onTap(() {
            widget.onDotTap(idx);
          });
        }).toList(),
      ),
    );
  }
}

void showActionSheet(BuildContext context, String come,{String url}) {
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(
            "Select Option",
            style: secondaryTextStyle(),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                finish(context);

              },
              child: Text(
                  come == "share profile"
                      ? 'Share profile to contacts'
                      : "Share document to contacts",
                  style: primaryTextStyle(
                      size: (SizeConfig.blockSizeVertical * 2).toInt(),
                      color: Colors.red)),
              isDefaultAction: true,
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                finish(context);

              },
              child: Text(
                  come == "share profile"
                      ? 'Share profile to new email'
                      : "Share document to new email",
                  style: primaryTextStyle(
                    size: (SizeConfig.blockSizeVertical * 2).toInt(),
                  )),
              isDefaultAction: true,
            ),
            come == "share profile"?
            CupertinoActionSheetAction(
              onPressed: () {
                finish(context);

              },
              child: Text(
                      'Share profile to Folder',
                  style: primaryTextStyle(
                    size: (SizeConfig.blockSizeVertical * 2).toInt(),
                  )),
              isDefaultAction: true,
            ):SizedBox(),

          ],
          cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                finish(context);
              },
              child: Text(
                'Cancel',
                style: primaryTextStyle(color: appColorPrimaryDark, size: 18),
              )),
        );
      });
}
