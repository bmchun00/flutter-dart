import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:drift/drift.dart';

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
      home: DatabaseApp(),
    );
  }

  Future<Database> initDatabase() async{

  }
}

class DatabaseApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DatabaseApp();
}

class _DatabaseApp extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Database Example"),
      ),
      body: Container(

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final todo = await Navigator.of(context).pushNamed('/add');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
