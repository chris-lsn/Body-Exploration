import 'package:flutter/material.dart';
import 'package:wing_fyp/pages/PlanetPage.dart';
import '../components/sideMenu.dart';

class PlanetsPage extends StatelessWidget {
  _moveTo(context, type, image) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PlanetPage(context, type, image)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        appBar: AppBar(
          centerTitle: true,
          title: Text('星球'),
          backgroundColor: Color(0xFF133049),
          elevation: 0,
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/plants_background.jpg"), fit: BoxFit.fitWidth, alignment: Alignment.bottomCenter)),
            padding: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 1400,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Text('請選擇您想認識的器官', style: TextStyle(fontSize: 18)),
                Positioned(
                    child: InkWell(
                        child: Image.asset(
                          'assets/images/fyp_fin_hh.png',
                          width: 210,
                        ),
                        onTap: () => _moveTo(context, '心臟', 'fyp_fin_hh.png')),
                    top: 70,
                    left: 20),
                Positioned(
                  child: InkWell(
                      child: Image.asset(
                        'assets/images/fyp_fin_L.png',
                        width: 180,
                      ),
                      onTap: () => _moveTo(context, '肺', 'fyp_fin_L.png')),
                  top: 290,
                  right: 30,
                ),
                Positioned(
                  child: InkWell(
                      child: Image.asset(
                        'assets/images/fyp_fin_liver.png',
                        width: 180,
                      ),
                      onTap: () => _moveTo(context, '肝', 'fyp_fin_liver.png')),
                  top: 490,
                  left: 50,
                ),
                Positioned(
                  child: InkWell(
                      child: Image.asset(
                        'assets/images/fyp_fin_stomach.png',
                        width: 180,
                      ),
                      onTap: () => _moveTo(context, '胃', 'fyp_fin_stomach.png')),
                  top: 690,
                  right: 50,
                ),
                Positioned(
                  child: InkWell(
                      child: Image.asset(
                        'assets/images/fyp_fin_kidney.png',
                        width: 160,
                      ),
                      onTap: () => _moveTo(context, '腎', 'fyp_fin_kidney.png')),
                  top: 900,
                  left: 50,
                ),
              ],
            ),
          ),
        ));
  }
}
