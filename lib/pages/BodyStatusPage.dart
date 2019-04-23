import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyStatusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BodyStatus();
}

class BodyStatus extends State<BodyStatusPage> {
  String _type = 'week';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('身體狀況'),
          backgroundColor: Color(0xFF133049),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fyp_bg2-01.jpg'),
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitWidth)),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("BMI計算機"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: RaisedButton(
                    child: Text(
                      "更新我的體重",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/recordFitness'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
                child: CupertinoSegmentedControl(
                
                  children: {
                    'week': Text('週'),
                    'month': Text('月'),
                    'year': Text('年'),
                  },
                  groupValue: _type,
                  onValueChanged: (val) {
                    setState(() => _type = val);
                  },
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Image.asset('assets/images/fyp_cc.png'),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.withOpacity(0.5)),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ));
  }
}
