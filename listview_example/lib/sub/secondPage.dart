import 'package:flutter/material.dart';
import '../animalItem.dart';

class SecondApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SecondApp();
  List<Animal>? list;
  SecondApp({Key? key, @required this.list}) : super(key: key);
}

class _SecondApp extends State<SecondApp>{
  final nameController = TextEditingController();
  int? _radioVal = 0;
  bool? flyExist = false;
  String? _imagePath;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(value: 0, groupValue: _radioVal, onChanged: _radioCng),
                  Text('양서류'),
                  Radio(value: 1, groupValue: _radioVal, onChanged: _radioCng),
                  Text('파충류'),
                  Radio(value: 2, groupValue: _radioVal, onChanged: _radioCng),
                  Text('포유류'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("날 수 있나요?"),
                  Checkbox(value: flyExist, onChanged: (bool? check){
                    setState(() {
                      flyExist = check;
                    });
                  })
                ],
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                      GestureDetector(
                        child: Image.asset('repo/images/cow.png',width: 80,),
                        onTap: (){
                          _imagePath = 'repo/images/cow.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/pig.png',width: 80,),
                        onTap: (){
                          _imagePath = 'repo/images/pig.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/bee.png',width: 80,),
                        onTap: (){
                          _imagePath = 'repo/images/bee.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/cat.png',width: 80,),
                        onTap: (){
                          _imagePath = 'repo/images/cat.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/dog.png',width: 80,),
                        onTap: (){
                          _imagePath = 'repo/images/dog.png';
                          print(_imagePath);
                        },
                      ),
                    GestureDetector(
                      child: Image.asset('repo/images/fox.png',width: 80,),
                      onTap: (){
                        _imagePath = 'repo/images/fox.png';
                        print(_imagePath);
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/monkey.png',width: 80,),
                      onTap: (){
                        _imagePath = 'repo/images/monkey.png';
                        print(_imagePath);
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){
                var animal = Animal(animalName: nameController.value.text, kind: getKind(_radioVal), imagePath: _imagePath, flyExist: flyExist);
                AlertDialog dialog = AlertDialog(
                  title: Text("동물 추가하기"),
                  content: Text("이 동물은 ${animal.animalName}이고, ${animal.kind}입니다.￦n동물을 추가하시겠습니까?", style: TextStyle(fontSize: 15),),
                  actions: [
                    ElevatedButton(onPressed: (){
                      widget.list?.add(animal);
                      Navigator.of(context).pop();
                    }, child: Text("네")),

                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("아뇨")),
                  ],
                );
                showDialog(context: context, builder: (BuildContext context) => dialog);
              }, child: Text("동물 추가"))
            ],
          ),
        ),
      ),
    );
  }
  getKind(int? value){
    switch(value){
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
      default:
        return "알 수 없음";
    }
  }
  _radioCng(int? value){
    setState((){
      _radioVal = value;
    });
  }
}
