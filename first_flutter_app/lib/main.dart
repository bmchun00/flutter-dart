import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var textString="눌러보세요";
  Color bColor = Colors.amber;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(bColor)),
            child: Text(textString,style: TextStyle(fontSize: 15),),
            onPressed: (){
              setState(() {
                if(textString=="눌렀구나") {
                  textString = "눌러보세요";
                  bColor = Colors.amber;
                }
                else {
                  textString = "눌렀구나";
                  bColor = Colors.deepOrange;
                }
              });
            },
          ),
        ),
      )
    );
  }
}
