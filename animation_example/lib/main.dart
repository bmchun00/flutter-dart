import 'package:flutter/material.dart';
import 'people.dart';

Map<int, Color> color =
{
  50:Color.fromRGBO(134,38,51, .1),
  100:Color.fromRGBO(134,38,51, .2),
  200:Color.fromRGBO(134,38,51, .3),
  300:Color.fromRGBO(134,38,51, .4),
  400:Color.fromRGBO(134,38,51, .5),
  500:Color.fromRGBO(134,38,51, .6),
  600:Color.fromRGBO(134,38,51, .7),
  700:Color.fromRGBO(134,38,51, .8),
  800:Color.fromRGBO(134,38,51, .9),
  900:Color.fromRGBO(134,38,51, 1),
};

MaterialColor Crimson = MaterialColor(0xFF862633, color);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Crimson,
      ),
      home: AnimationApp()
    );
  }
}

class AnimationApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _AnimationApp();


}

class _AnimationApp extends State<StatefulWidget>{
  List<People> peoples = new List.empty(growable: true);
  int current = 0;
  Color weightColor = Colors.blue;
  double _opacity = 1;

  @override
  void initState(){
    super.initState();

    peoples.add(People('스미스', 180, 92));
    peoples.add(People('메리', 150, 72));
    peoples.add(People('존', 100, 42));
    peoples.add(People('바트', 130, 102));
    peoples.add(People('디디', 180, 11));
    peoples.add(People('콘', 80, 12));
  }

  void _changeWeightColor(double weight){
    if(weight < 40){
      weightColor = Colors.blueAccent;
    }else if(weight < 60){
      weightColor = Colors.indigo;
    }else if(weight < 80){
      weightColor = Colors.orange;
    }else{
      weightColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: Duration(seconds: 1),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 100,child: Text("이름 : ${peoples[current].name}"),),
                      AnimatedContainer(
                        duration: Duration(seconds:2),
                        curve: Curves.linear,
                        color: Colors.amber,
                        child: Text(
                          '키 ${peoples[current].height}',
                          textAlign: TextAlign.center,
                        ),
                        width: 50,
                        height: peoples[current].height,
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds:2),
                        curve: Curves.easeInCubic,
                        color: weightColor,
                        child: Text(
                          '몸무게 ${peoples[current].weight}',
                          textAlign: TextAlign.center,
                        ),
                        width: 50,
                        height: peoples[current].weight,
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        curve: Curves.linear,
                        color: Colors.pinkAccent,
                        child: Text(
                          'bmi ${peoples[current].bmi.toString().substring(0,2)}',
                          textAlign: TextAlign.center,
                        ),
                        width: 50,
                        height: peoples[current].bmi,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ),
                height: 200
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  _changeWeightColor(peoples[current].weight);
                  if(current<peoples.length - 1) current++;
                });
              }, child: Text("NEXT")),
              ElevatedButton(onPressed: (){
                setState(() {
                  _changeWeightColor(peoples[current].weight);
                  if(current>0) current--;
                });
              }, child: Text("PREVIOUS")),
              ElevatedButton(onPressed: (){
                setState(() {
                  _opacity = _opacity==1?0:1;
                });
              }, child: Text("OPACITY 0")),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}