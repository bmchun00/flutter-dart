import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SubDetail();
}

class _SubDetail extends State<StatefulWidget>{
  List<String> todoList = new List.empty(growable: true);

  @override
  void initState(){
    super.initState();
    todoList.add("당근 사오기");
    todoList.add("약 사오기");
    todoList.add("청소하기");
    todoList.add("부모님께 전화하기");
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub Detail Example"),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Card(
          child: InkWell(
            child: Text(
              todoList[index],
              style: TextStyle(fontSize: 15),
            ),
            onTap: (){
              Navigator.of(context).pushNamed('/third', arguments: todoList[index]);
            },
          ),
        );
      }, itemCount: todoList.length,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          addList(context);
        },
      ),
    );
  }
  void addList(BuildContext context) async{
    final res = await Navigator.of(context).pushNamed('/second');
    setState(() {
      todoList.add(res as String);
    });
  }
}