import 'package:flutter/material.dart';

class HealthEvaluationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HealthEvaluationPageState();
  }
}

class HealthEvaluationPageState extends State<HealthEvaluationPage> {
  List<bool> _flats = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
  final now = DateTime.now();

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('健康評估'),
        centerTitle: true,
        backgroundColor: Color(0xFF133049),
        
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fyp_bg3-01.jpg"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.all(10),
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
            Container(padding: EdgeInsets.symmetric(horizontal: 15) ,child: Text('提交您的健康評估結果，並賺取「人體探索」積分。您必須填寫所有相關欄位，並附上清楚的健康評估結果照片，以便符合賺取積分的資格。')),
            SizedBox(height: 20,),
            Text('「人體探索」健康檢視'),
            SwitchListTile(
              title: Text('BMI指數測量值'),
              subtitle: Text('(請輸入至少一數值)', style: TextStyle(color: Colors.redAccent)),
              value: _flats[0],
              onChanged: (val) => setState(() => _flats[0] = val),
            ),
            _flats[0] ? Container(
              padding: EdgeInsets.only(left: 20),
              child:  Column(children: <Widget>[
                _buildInputField('體重', '新增 (磅)'),
                _buildInputField('身高', '新增 (英尺英寸)'),
                _buildInputField('腰部', '新增 (英寸)'),
              ],)
            ) : Container(),
            SwitchListTile(
              title: Text('血壓'),
              subtitle: Text('(二數值皆需輸入)', style: TextStyle(color: Colors.redAccent)),
              value: _flats[1],
              onChanged: (val) => setState(() => _flats[1] = val),
            ),
            _flats[1] ? Container(
              padding: EdgeInsets.only(left: 20),
              child:  Column(children: <Widget>[
                _buildInputField('收縮壓', '新增 (mmHg)'),
                _buildInputField('舒張壓', '新增 (mmHg)'),
              ],)
            ) : Container(),
            SwitchListTile(
              title: Text('血糖'),
              subtitle: Text('(請輸入至少一數值)', style: TextStyle(color: Colors.redAccent)),
              value: _flats[2],
              onChanged: (val) => setState(() => _flats[2] = val),
            ),
            _flats[2] ? Container(
              padding: EdgeInsets.only(left: 20),
              child:  Column(children: <Widget>[
                _buildInputField('空腹', '新增 (毫克/分升)'),
                _buildInputField('隨機', '新增 (毫克/分升)'),
              ],)
            ) : Container(),
            SwitchListTile(
              title: Text('總膽固醇'),
              subtitle: Text('(請輸入至少一數值)', style: TextStyle(color: Colors.redAccent)),
              value: _flats[3],
              onChanged: (val) => setState(() => _flats[3] = val),
            ),
             _flats[3] ? Container(
              padding: EdgeInsets.only(left: 20),
              child:  Column(children: <Widget>[
                _buildInputField('總和', '新增 (毫克/分升)'),
                _buildInputField('HDL', '新增 (毫克/分升)'),
                _buildInputField('LDL', '新增 (毫克/分升)'),
                _buildInputField('三酸甘油脂', '新增 (毫克/分升)'),
              ],)
            ) : Container(),
            SwitchListTile(
              title: Text('糖化血色素淨 (HbA1c)'),
              subtitle: Text('(請輸入至少一數值)', style: TextStyle(color: Colors.redAccent)),
              value: _flats[4],
              onChanged: (val) => setState(() => _flats[4] = val),
            ),
            _flats[4] ? Container(
              padding: EdgeInsets.only(left: 20),
              child:  Column(children: <Widget>[
                _buildInputField('糖化血色...', '新增 (%)'),
              ],)
            ) : Container(),
            SizedBox(height: 20,),
            Text('進階普查'),
            SwitchListTile(
              title: Text('糞便隱血檢查 (FOBT)'),
              value: _flats[5],
              onChanged: (val) => setState(() => _flats[5] = val),
            ),
            SwitchListTile(
              title: Text('乳房X光檢查'),
              value: _flats[6],
              onChanged: (val) => setState(() => _flats[6] = val),
            ),
            SwitchListTile(
              title: Text('字宮頸抹片'),
              value: _flats[7],
              onChanged: (val) => setState(() => _flats[7] = val),
            ),
            SwitchListTile(
              title: Text('前列腺特異掘抗原 (PSA) 檢驗'),
              value: _flats[8],
              onChanged: (val) => setState(() => _flats[8] = val),
            ),
            SwitchListTile(
              title: Text('牙科評估'),
              value: _flats[9],
              onChanged: (val) => setState(() => _flats[9] = val),
            ),
            SizedBox(height: 20,),
            Text('接種疫苗'),
            SwitchListTile(
              title: Text('流感疫苗接種'),
              value: _flats[10],
              onChanged: (val) => setState(() => _flats[10] = val),
            ),
            SwitchListTile(
              title: Text('乙型肝炎疫苗接種'),
              value: _flats[11],
              onChanged: (val) => setState(() => _flats[11] = val),
            ),
            SwitchListTile(
              title: Text('乳頭瘤病毒 (HPV)'),
              value: _flats[12],
              onChanged: (val) => setState(() => _flats[12] = val),
            ),
          ],
        ),
      ),
    );
  }
}
