import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'memo.dart';
import 'memoAdd.dart';

class MemoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MemoPage();
}

class _MemoPage extends State<StatefulWidget>{
  FirebaseDatabase? _database;
  DatabaseReference? reference;
  String _databaseURL = "https://example-dc304-default-rtdb.firebaseio.com/";
  List<Memo> memos = new List.empty(growable: true);

  @override
  void initState(){
    super.initState();
    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database!.reference().child('memo');

    reference!.onChildAdded.listen((event) {
      print(event.snapshot.value.toString());
      setState(() {
        memos.add(Memo.fromSnapShot(event.snapshot));
      });
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Memo App (with Firebase)"),
      ),
      body: Container(
        child: Center(
          child: memos.length == 0 ? CircularProgressIndicator() : GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2), itemBuilder: (context,index){
            return Card(
              child: Container(
                child: GridTile(
                  child: Container(
                    padding: EdgeInsets.only(top:20, bottom:20),
                    child: SizedBox(
                      child: GestureDetector(
                        onTap: (){
                          
                        },
                        onLongPress: (){
                          
                        },
                        child: Text(memos[index].content!),
                      ),
                    ),
                  ),
                  header: Text(memos[index].title!),
                  footer: Text(memos[index].createTime!.substring(0,10)),
                ),
              ),
            );
          },itemCount: memos.length,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MemoAddPage(reference!)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}