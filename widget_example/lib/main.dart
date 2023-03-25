import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = "Widget (Stateful)";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget{
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = new List.empty(growable: true);
  String? _buttonText;
  String sum="";
  TextEditingController val1 = TextEditingController();
  TextEditingController val2 = TextEditingController();
  @override
  void initState(){
    super.initState();
    for(var item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item),));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example')
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(30),child: Text('결과 : $sum', style: TextStyle(fontSize: 30),),),
              Padding(padding: EdgeInsets.all(30),child: TextField(
                keyboardType: TextInputType.number, controller: val1,
              ),),
              Padding(padding: EdgeInsets.all(30),child: TextField(
                keyboardType: TextInputType.number, controller: val2,
              ),),
              Padding(padding: EdgeInsets.all(30),child: ElevatedButton(onPressed: (){
                setState(() {
                  int res = int.parse(val1.value.text)+int.parse(val2.value.text);
                  sum = '$res';
                });
              }, child: Row(
                children: [
                  Icon(Icons.add), Text("더하기")
                ],
              ),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
              ),
              ),
              Padding(padding: EdgeInsets.all(20),
              child: DropdownButton(
                value: _buttonText,
                items: _dropDownMenuItems, onChanged: (String? value){
                setState(() {
                  _buttonText = value;
                },);
              },),
              )
            ],
          ),
        ),
      ),
    );
  }
}