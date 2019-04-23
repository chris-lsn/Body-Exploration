import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String energyUnit = '千焦 (kj)';
  String language = '繁體中文';

  void _notifyUser(text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));
  }

  Widget _buildEnergyUnitActionSheet() {
    return CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('千焦 (kj)'),
            onPressed: () {
              setState(() => energyUnit = '千焦 (kj)');
              Navigator.pop(context);
              _notifyUser('熱量單位已轉為千焦 (kj)');
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('千卡 (kcl)'),
            onPressed: () {
              setState(() => energyUnit = '千卡 (kcl)');
              Navigator.pop(context);
              _notifyUser('熱量單位已轉為千卡 (kcl)');
            },
          )
        ],
        cancelButton:
            CupertinoActionSheetAction(child: const Text('取消'), isDefaultAction: true, onPressed: () => Navigator.pop(context)));
  }

   Widget _buildLanguageActionSheet() {
    return CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('繁體中文'),
            onPressed: () {
              setState(() => language = '繁體中文');
              Navigator.pop(context);
              _notifyUser('語言已轉為繁體中文');
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('英文'),
            onPressed: () {
              setState(() => language = '英文');
              Navigator.pop(context);
              _notifyUser('語言已轉為英文');
            },
          )
        ],
        cancelButton:
            CupertinoActionSheetAction(child: const Text('取消'), isDefaultAction: true, onPressed: () => Navigator.pop(context)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('設定'),
        backgroundColor: Color(0xFF133049),
        centerTitle: true,
        
      ),
      body: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fyp_bg3-01.jpg'),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitWidth
            )
          ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          children: <Widget>[
            ListTile(
                title: Text('熱量單位'),
                trailing: InkWell(
                  enableFeedback: false,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        energyUnit,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: () => showCupertinoModalPopup(context: context, builder: (context) => _buildEnergyUnitActionSheet()) ,
                )),
                ListTile(
                title: Text('語言'),
                trailing: InkWell(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        language,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: () => showCupertinoModalPopup(context: context, builder: (context) => _buildLanguageActionSheet()),
                )),
            
            SizedBox(
              height: 40,
            ),
            ListTile(
              title: Text('身高'),
              trailing: Text(
                '165cm',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              title: Text('體重'),
              trailing: Text(
                '56kg',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              title: Text('性別'),
              trailing: Text(
                'F',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              title: Text('年齡'),
              trailing: Text(
                '25',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
