import 'package:firebase_database/firebase_database.dart';

class Memo{
  String? key;
  String? title;
  String? content;
  String? createTime;

  Memo(this.title, this.content, this.createTime);

  Memo.fromSnapShot(DataSnapshot snapshot){
    Map map = Map.from(snapshot.value as Map);
    key = snapshot.key;
    title = map['title'];
    content = map['content'];
    createTime = map['createTime'];
  }


  toJSON(){
    return{
      'title' : title,
      'content' : content,
      'createTime' : createTime
    };
  }
}