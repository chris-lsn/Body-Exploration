import 'package:flutter/material.dart';

class FitnessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('體能'),
        backgroundColor: Color(0xFF133049),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fyp_bg3-01.jpg'),
                  alignment: Alignment.bottomCenter,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  fit: BoxFit.fitWidth)),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: RaisedButton(
                    child: Text("記錄您的鍛鍊", style: TextStyle(fontSize: 16),),
                    onPressed: () => Navigator.pushNamed(context, '/recordFitness'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: ListTile.divideTiles(color: Color(0xFF90A5D3), context: context, tiles: [
                  ListTile(
                    title: Text('我的鍛鍊'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('卡路里燃燒量計算機'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                    ),
                    onTap: () {},
                  ),
                ]).toList(),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '您尚未將任何配置或應用程式連接至「人體探索」。連接配置至「人體探索」，即可透過參加合資格的活動而賺取「人體探索」積分。',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
              ListTile(
                title: Text('健身配置與應用程式'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                ),
                onTap: () => Navigator.pushNamed(context, '/devices'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
