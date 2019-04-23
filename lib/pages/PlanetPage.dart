import 'package:flutter/material.dart';
import 'dart:convert';

class PlanetPage extends StatefulWidget {
  final String type, image;
  PlanetPage(context, this.type, this.image);
  @override
  State<StatefulWidget> createState() => PlanetPageState();
}

class PlanetPageState extends State<PlanetPage> {
  var organs;

  @override
  initState() {
    _loadData();
    super.initState();
  }
  
  _loadData() async {
    var data = json.decode(await DefaultAssetBundle.of(context).loadString("assets/data/organ.json"));
    setState(() => organs = data);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.type),
          backgroundColor: Color(0xFF133049),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fyp_bg2-01.jpg'),
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth)),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: widget.type == '腎' ? 20 : 50),
                  child: Image.asset('assets/images/${widget.image}'),
                ),
              ),
              Container(
                height: 200,
                child: PageView.builder(
                  itemCount: organs != null ? organs[widget.type].length : 0,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        children: <Widget>[
                          Text(
                            (i + 1).toString() + '. ' + organs[widget.type][i]['disease_name'],
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            "\n病徵: " + organs[widget.type][i]['symptom'],
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            "\n原因: " + organs[widget.type][i]['reason'],
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
