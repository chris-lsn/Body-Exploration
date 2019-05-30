import 'package:flutter/material.dart';

class AwardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text('獎賞'),
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
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('您積極投入「人體探索」,累積的積分愈多,會員級別亦會因此提升,而您的保費折扣,額外保障,醫療賠償及生活消閒獎賞隨即更豐富,您亦會活得更健康。請點擊以下合作夥伴查看優惠詳情。')),
            SizedBox(height: 20,),
            ListTile(title: Text('「人體探索」'), subtitle: Text('「人體探索」 最高可享高達85折保費折扣或15%額外保障及藉改善健康狀況,從而提升醫療保障', style: TextStyle(color: Colors.redAccent),), trailing: Icon(Icons.keyboard_arrow_right),),
            ListTile(title: Text('UA 院線'), subtitle: Text('每月可獲得達2張電影票', style: TextStyle(color: Colors.redAccent),), trailing: Icon(Icons.keyboard_arrow_right),),
            ListTile(title: Text('余仁生'), subtitle: Text('高達7折', style: TextStyle(color: Colors.redAccent),), trailing: Icon(Icons.keyboard_arrow_right),),
            ListTile(title: Text('萬寧'), subtitle: Text('賺取高達\$500的萬寧禮券', style: TextStyle(color: Colors.redAccent),), trailing: Icon(Icons.keyboard_arrow_right),),
            ListTile(title: Text('海洋公園'), subtitle: Text('高達88折', style: TextStyle(color: Colors.redAccent),), trailing: Icon(Icons.keyboard_arrow_right),),
            ListTile(title: Text('亞洲航空'), subtitle: Text('高達5折', style: TextStyle(color: Colors.redAccent),), trailing: Icon(Icons.keyboard_arrow_right),),
            ListTile(title: Text('阿聯酋航空'), subtitle: Text('即將推出', style: TextStyle(color: Colors.redAccent),), trailing: Icon(Icons.keyboard_arrow_right),),

          ],
        ),
      ),);
  }
}