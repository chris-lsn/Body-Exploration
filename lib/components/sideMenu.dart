import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF487CA8),
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF204C78)),
                accountName: Text(
                  "Wing Yi Yip",
                ),
                accountEmail: Text(
                  "wingyi.yip@gmail.com",
                )),
            ListTile(
              trailing: Image.asset('assets/images/icon_home.png', width: 17),
              title: Text('首頁'),
              onTap: () => Navigator.popUntil(context, ModalRoute.withName('/home')),
            ),
            ListTile(
                trailing: Image.asset(
                  'assets/images/icon_fitness.png',
                  width: 17,
                ),
                title: Text('體能'),
                onTap: () => Navigator.pushNamed(context, '/fitness')),
            ListTile(
              trailing: Image.asset(
                'assets/images/icon_evaluation.png',
                width: 17,
              ),
              title: Text('健康評估'),
              onTap: () {},
            ),
            ListTile(
              trailing: Image.asset(
                'assets/images/icon_award.png',
                width: 17,
              ),
              title: Text('獎賞'),
              onTap: () {},
            ),
            ListTile(
              trailing: Image.asset(
                'assets/images/icon_setting.png',
                width: 17,
              ),
              title: Text('設定'),
              onTap: () => Navigator.pushNamed(context, '/setting'),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
