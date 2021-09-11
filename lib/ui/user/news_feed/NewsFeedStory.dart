import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsFeedStory extends StatefulWidget {
  static const route = '/NewsFeedStory';

  @override
  _NewsFeedStoryState createState() => _NewsFeedStoryState();
}

class _NewsFeedStoryState extends State<NewsFeedStory> {
  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
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
          Text(
            'Healthlines',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                fillColor: appColorPrimary,
                color: apptextcolor,
                borderWidth: 2,
                selectedColor: Colors.white,
                borderRadius: BorderRadius.circular(8),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'NewsFeed',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 25),
                    child: Text(
                      'Stories',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                isSelected: isSelected,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return newsFeedCard();
                }),
          )
        ],
      ),
    );
  }

  newsFeedCard() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(SampleProfileImageUrl),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Dr. Ravish'),
                ],
              ),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              SampleProfileImageUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.thumb_up,
                      color: appColorPrimary,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.comment,
                      color: appColorPrimary,
                    ),
                    onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
