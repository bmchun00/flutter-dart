import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'main.dart';
import 'memo.dart';

class MemoDetailPage extends StatefulWidget{
  final DatabaseReference reference;
  final Memo memo;

  MemoDetailPage(this.reference, this.memo);

  @override
  State<StatefulWidget> createState() => _MemoDetailPage();
}

class _MemoDetailPage extends State<MemoDetailPage>{
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState(){
    super.initState();
    titleController = TextEditingController(text: widget.memo.title);
    contentController = TextEditingController(text: widget.memo.content);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit ${widget.memo.title ?? "untitled"} Memo"),
      ),
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
                Memo memo = Memo(titleController!.value.text,contentController!.value.text,DateTime.now().toIso8601String());
                widget.reference.child(widget.memo.key!).set(memo.toJSON()).then((_){
                  Navigator.of(context).pop(memo);
                });
              },
                  child: Text("Edit Memo"))
            ],
          ),
        ),
      ),
    );
  }
}