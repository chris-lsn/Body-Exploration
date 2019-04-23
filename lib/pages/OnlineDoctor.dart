import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnlineDoctorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OnlineDoctorPageState();
}

class OnlineDoctorPageState extends State<OnlineDoctorPage> {
  int _selectedDiseaseTypeIndex = -1;
  int _selectedLocationIndex = -1;
  String _location = "";
  String _diseaseType = "";
  final List<String> _locations = ['旺角', '中環', '尖沙咀', '荃灣'];
  final List<String> _diseaseTypes = ['骨科', '婦科', '內科', '外科', '精神科'];

  _showLocationPicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: _selectedLocationIndex),
              backgroundColor: Colors.black54,
              itemExtent: 32,
              onSelectedItemChanged: (index) {
                setState(() {
                  _location = _locations[index];
                  _selectedLocationIndex = index;
                });
              },
              children: List.generate(_locations.length, (int index) {
                return Center(
                  child: Text(
                    _locations[index],
                    style: TextStyle(fontSize: 17),
                  ),
                );
              }),
            ),
          );
        });
  }

  _showDiseaseTypePicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: _selectedDiseaseTypeIndex),
              backgroundColor: Colors.black54,
              itemExtent: 32,
              onSelectedItemChanged: (index) {
                setState(() {
                  _diseaseType = _diseaseTypes[index];
                  _selectedDiseaseTypeIndex = index;
                });
              },
              children: List.generate(_diseaseTypes.length, (int index) {
                return Center(
                  child: Text(
                    _diseaseTypes[index],
                    style: TextStyle(fontSize: 17),
                  ),
                );
              }),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('網絡醫生'),
        centerTitle: true,
        backgroundColor: Color(0xFF133049),
      ),
      body: Container(
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/fyp_bg3-01.jpg'), alignment: Alignment.bottomCenter, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),fit: BoxFit.fitWidth)),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text('選擇診科'),
                trailing: InkWell(
                  enableFeedback: false,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        _diseaseType,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: () => _showDiseaseTypePicker(),
                )),
            SizedBox(
              height: 15,
            ),
            ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text('地區'),
                trailing: InkWell(
                  enableFeedback: false,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        _location,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: () => _showLocationPicker(),
                )),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '內科醫生\n趙麗華醫生\n地址： 新界荃灣青山公路荃豐中心C80號舖\n電話： 2402 3681',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF204C78),
                        border: Border.all(
                          color: Color(0xFF3CE5C8),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '黃榮光醫生\n地址： 荃灣青山公路荃灣段264-298號南豐中心6樓605室\n電話： 2408 2777',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF204C78),
                        border: Border.all(
                          color: Color(0xFF3CE5C8),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '劉紹輝醫生\n地址： 新界荃灣青山公路144號荃豐中心商場1樓B9室\n電話： 3621 0936',
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF204C78),
                        border: Border.all(
                          color: Color(0xFF3CE5C8),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
