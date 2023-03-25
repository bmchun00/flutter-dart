import 'package:flutter/material.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';
import 'animalItem.dart';
import './cupertinoMain.dart';

void main() {
  runApp(CupertinoMain());
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
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Animal> animalList = new List.empty(growable: true);
  TextStyle _textStyle = TextStyle(color: Colors.black);
  String _buttonStr = "멈춰있음";
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller?.addListener(() {
      setState(() {
        if (controller!.indexIsChanging){
          _buttonStr = "이동중";
        }
        else{
          _buttonStr = "멈춰있음";
        }
      });
    });
    animalList.add(Animal(animalName: "벌", kind: "곤충",imagePath: "repo/images/bee.png"));
    animalList.add(Animal(animalName: "고양이", kind: "포유류",imagePath: "repo/images/cat.png"));
    animalList.add(Animal(animalName: "젖소", kind: "포유류",imagePath: "repo/images/cow.png"));
    animalList.add(Animal(animalName: "강아지", kind: "포유류",imagePath: "repo/images/dog.png"));
    animalList.add(Animal(animalName: "여우", kind: "포유류",imagePath: "repo/images/fox.png"));
    animalList.add(Animal(animalName: "원숭이", kind: "영장류",imagePath: "repo/images/monkey.png"));
    animalList.add(Animal(animalName: "돼지", kind: "포유류",imagePath: "repo/images/pig.png"));
    animalList.add(Animal(animalName: "늑대", kind: "포유류",imagePath: "repo/images/wolf.png"));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Example"),
      ),
      body: TabBarView(children: <Widget>[FirstApp(list: animalList,), SecondApp(list: animalList,),Text("Hi")], controller: controller,),
      bottomNavigationBar: TabBar(tabs: <Tab>[
        Tab(child: Text("지금은 ${controller?.index}이고", style: _textStyle,),) ,
        Tab(child: Text("${controller?.previousIndex}에 있다왔구나", style: _textStyle,),),
        Tab(child: Text(_buttonStr, style: _textStyle,),),
    ],controller: controller,),
    );
  }
}