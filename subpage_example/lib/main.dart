import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subpage Example',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '/',
      routes: {'/':(context)=>FirstPage(),
    '/second':(context)=>SecondPage()},
    );
  }
}

class FirstPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FirstPage();
}

class _FirstPage extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub Page Main"),
      ),
      body: Container(
        child: Center(
          child: Text("This is First Page."),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('/second');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text("Back"),
          ),
        ),
      ),
    );
  }
}