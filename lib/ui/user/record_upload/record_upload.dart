import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ayuvani/constant/AppColors.dart';
import 'package:flutter_ayuvani/constant/AppConstant.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordUpload extends StatefulWidget {
  static const route = '/RecordUpload';

  @override
  _RecordUploadState createState() => _RecordUploadState();
}

class _RecordUploadState extends State<RecordUpload> {
  FilePickerResult result;
  List<String> fileName = [];
  List<String> filepath = [];

  Future getFiles() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result != null) {
      setState(() {
        filepath = result.paths;
        fileName = result.names;
      });
    } else {
      // User canceled the picker
    }
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
            'Record Upload',
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
          GestureDetector(
            onTap: () {
              getFiles();
            },
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Choose Files',
                      style: TextStyle(color: apptextcolor),
                    ),
                    Container(
                      width: 30,
                      decoration: BoxDecoration(
                          color: apptextcolor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(
                        Icons.expand_more,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: [for (var chips in fileName) fileNameChips(name: chips)],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      fileName.clear();
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(appColorPrimary),
                  ),
                  child: Row(
                    children: [
                      Text('Delete All'),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.delete,
                        size: 25,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(appColorPrimary),
                  ),
                  child: Row(
                    children: [
                      Text('Upload'),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.cloud_upload,
                        size: 25,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Uploaded Records',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: textSizeNormal,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('File Name'),
                Text('Date'),
                Text('Time'),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return uploadedDocumentCard();
                }),
          )
        ],
      ),
    );
  }

  fileNameChips({String name}) {
    return Chip(
      backgroundColor: Colors.white,
      label: Text(
        name,
        style: TextStyle(color: appColorPrimary),
      ),
      deleteIcon: Icon(Icons.close),
      elevation: 3,
      deleteIconColor: appColorPrimary,
      onDeleted: () {
        setState(() {
          int index = fileName.indexOf(name);
          fileName.removeAt(index);
        });
      },
    );
  }

  uploadedDocumentCard() {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('File Name'),
            Text('18/3/201'),
            Text('11:30 AM'),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
