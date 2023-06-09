import 'package:firebase_example/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'memo.dart';

class MemoAddPage extends StatefulWidget{
  final DatabaseReference reference;

  MemoAddPage(this.reference);

  @override
  State<MemoAddPage> createState() => _MemoAddPage();
}

class _MemoAddPage extends State<MemoAddPage>{
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState(){
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Add Memo"),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(

                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: "Title",
                      fillColor: Crimson,
                  ),
                  cursorColor: Crimson,
                  style: TextStyle(color: Crimson),
                ),
                width: 300,
              ),
              Container(
                height: 300,
                  width: 300,
                  child: TextField(
                controller: contentController,
                keyboardType: TextInputType.multiline,
                maxLines: 100,
                decoration: InputDecoration(labelText: "Content"),
              )),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                widget.reference.push().set(Memo(titleController!.value.text,contentController!.value.text,DateTime.now().toIso8601String()).toJSON()).then((_){
                  Navigator.of(context).pop();
                });
              },
              child: Text("Add Memo"))
            ],
          ),
        ),
      ),
    );
  }
}