import 'package:flutter/material.dart';

class RecordFitnessPage extends StatelessWidget {
  final now = DateTime.now();

  @override
  Widget _buildInputField(String name, String hint) {
    return ListTile(
      title: Text(name),
      trailing: Container(
        width: 150.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration.collapsed(hintText: hint),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('記錄鍛鍊'),
        centerTitle: true,
        backgroundColor: Color(0xFF133049),
        actions: <Widget>[
          FlatButton(
            child: Text(
              '完成',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fyp_bg2-01.jpg'),
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: FlatButton(
                child: Icon(Icons.chevron_left),
                onPressed: () {},
              ),
              trailing: FlatButton(
                child: Icon(Icons.chevron_right),
                onPressed: () {},
              ),
              title: Center(child: Text('${now.year}年${now.month}月${now.day}日')),
            ),
            Divider(color: Colors.blueGrey),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: ListTile.divideTiles(color: Colors.grey, context: context, tiles: [
                      _buildInputField('活動', '選擇一項活動'),
                      _buildInputField('劇烈度', '選擇劇烈度'),
                      _buildInputField('時間', '0小時0分鐘0秒'),
                      _buildInputField('距離', '新增'),
                      _buildInputField('心跳距離', '新增'),
                    ]).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
