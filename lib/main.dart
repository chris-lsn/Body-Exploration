import 'package:flutter/material.dart';
import 'package:wing_fyp/pages/BodyStatusPage.dart';
import 'package:wing_fyp/pages/FitnessPage.dart';
import 'package:wing_fyp/pages/OnlineDoctor.dart';
import 'package:wing_fyp/pages/PlanetsPage.dart';
import 'package:wing_fyp/pages/RecordFitness.dart';
import 'package:wing_fyp/pages/SettingPage.dart';
import 'pages/SplashPage.dart';
import 'pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SplashPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/planets': (context) => PlanetsPage(),
        '/setting': (context) => SettingPage(),
        '/fitness': (context) => FitnessPage(),
        '/bodyStatus': (context) => BodyStatusPage(),
        '/recordFitness': (context) => RecordFitnessPage(),
        '/onlineDoctor': (context) => OnlineDoctorPage(),
        '/splash': (context) => SplashPage()
      },
    );
  }
}
