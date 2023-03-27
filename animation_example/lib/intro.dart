import 'package:flutter/material.dart';
import 'saturnLoading.dart';
import 'dart:async';
import 'main.dart';

class IntroPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _IntroPage();
}

class _IntroPage extends State<StatefulWidget>{
  @override
  void initState(){
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async{
    return Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AnimationApp()));
  }
 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Animation App'),
              SizedBox(
                height: 20,
              ),
              SaturnLoading()
            ],
          ),
        ),
      ),
    );
  }
}