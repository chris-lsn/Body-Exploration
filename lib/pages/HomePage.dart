import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/sideMenu.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _key = GlobalKey<ScaffoldState>();
  File _image;

  showGetImageOptionActionsheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('拍照'),
                onPressed: () => getImage('camera'),
              ),
              CupertinoActionSheetAction(
                child: Text('圖庫'),
                onPressed: () => getImage('gallery'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('取消'),
              onPressed: () => Navigator.pop(context),
            ),
          );
        });
  }

  Future getImage(type) async {
    var image;
    if (type == 'camera')
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    else
      image = await ImagePicker.pickImage(source: ImageSource.gallery);

    Navigator.pop(context);
    _key.currentState.showSnackBar(SnackBar(
      content: Text("病歷已上載"),
    ));
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: SideMenu(),
        appBar: AppBar(
          backgroundColor: Color(0xFF133049),
          centerTitle: true,
          title: Text('首頁'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => Navigator.pushNamed(context, '/splash'),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  image: AssetImage('assets/images/fyp_bg3-01.jpg'),
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitWidth)),
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                InkWell(
                  child: Image.asset(
                    'assets/images/home_bodyStatus.png',
                    height: 100,
                  ),
                  onTap: () => Navigator.pushNamed(context, '/bodyStatus'),
                ),
                InkWell(
                  child: Image.asset(
                    'assets/images/home_planets.png',
                    height: 100,
                  ),
                  onTap: () => Navigator.pushNamed(context, '/planets'),
                ),
              ]),
              SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                InkWell(
                  child: Image.asset(
                    'assets/images/home_doctor.png',
                    height: 100,
                  ),
                  onTap: () => Navigator.pushNamed(context, '/onlineDoctor'),
                ),
                InkWell(
                  child: Image.asset(
                    'assets/images/home_healthRecord.png',
                    height: 100,
                  ),
                  onTap: () => showGetImageOptionActionsheet(),
                ),
              ]),
            ],
          ),
        ));
  }
}
