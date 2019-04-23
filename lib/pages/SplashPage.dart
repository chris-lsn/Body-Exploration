import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  bool _login = false;
  final _formKey = GlobalKey<FormState>();
  double _logoHeight = 180;
  double _logoTopPadding = 170;
  String username;
  String password;

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return "用戶名不能為空";
                } else if (val != 'fyp') {
                  return '錯誤的用戶名';
                }
              },
              decoration: InputDecoration(
                  labelText: '帳戶名稱',
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(width: 0.1))),
              onSaved: (val) => username = val,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return "密碼不能為空";
                } else if (val != 'fyp') {
                  return '錯誤的密碼';
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                  labelText: '密碼',
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(width: 0.1))),
              onSaved: (val) => password = val,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18385A),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: _logoTopPadding),
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOutCubic,
                width: _logoHeight,
                child: Image.asset('assets/images/splash_logo.png'),
              ),
            ),
          ),
          AnimatedOpacity(opacity: _login ? 1.0 : 0.0, duration: Duration(milliseconds: 800), child: Padding(padding: EdgeInsets.only(top: 20), child: _buildLoginForm())),
          SizedBox(height: 10,),
          FlatButton(
              child: Text(
                '登入',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              onPressed: ()  {
                    if (!_login) {
                      setState(() {
                        _login = true;
                        _logoHeight = 80;
                        _logoTopPadding = 150;
                      });
                    } else {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
            ),
        ],
      ),
    );
  }
}
