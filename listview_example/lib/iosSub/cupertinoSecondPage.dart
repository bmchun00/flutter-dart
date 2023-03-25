import 'package:flutter/cupertino.dart';
import 'package:listview_example/animalItem.dart';

class CupertinoSecondPage extends StatefulWidget {
  final List<Animal>? animalList;
  const CupertinoSecondPage({Key? key, required this.animalList}) : super(key:key);

  @override
  State<StatefulWidget> createState() => _CupertinoSecondPage();
}

class _CupertinoSecondPage extends State<CupertinoSecondPage> {
  TextEditingController? _textController;
  int _kind = 0;
  bool _flyExist = false;
  String? _imagePath;
  Map<int, Widget> segmentWidgets = {
    0: SizedBox(
      child: Text("양서류", textAlign: TextAlign.center,),
      width: 80,
    ),
    1: SizedBox(
      child: Text("포유류", textAlign: TextAlign.center,),
      width: 80,
    ),
    2: SizedBox(
      child: Text("파충류", textAlign: TextAlign.center,),
      width: 80,
    ),
  };


  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("동물 추가"),
      ),
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),
              child: CupertinoTextField(
                controller: _textController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              ),
              CupertinoSegmentedControl(children: segmentWidgets, onValueChanged: (int value){
                setState(() {
                  _kind = value;
                });
              }, groupValue: _kind,
              padding: EdgeInsets.only(bottom: 20,top: 20),
              ),
              Row(
                children: <Widget>[
                  Text("날개가 존재합니까?"),
                  CupertinoSwitch(value: _flyExist, onChanged: (value){
                    setState(() {
                      _flyExist = value;
                    });
                  })
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(
                height:100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset('repo/images/cow.png',width:80,),
                      onTap:(){
                        _imagePath = "repo/images/cow.png";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/pig.png',width:80,),
                      onTap:(){
                        _imagePath = "repo/images/pig.png";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/bee.png',width:80,),
                      onTap:(){
                        _imagePath = "repo/images/bee.png";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/cat.png',width:80,),
                      onTap:(){
                        _imagePath = "repo/images/cat.png";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/fox.png',width:80,),
                      onTap:(){
                        _imagePath = "repo/images/fox.png";
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/monkey.png',width:80,),
                      onTap:(){
                        _imagePath = "repo/images/monkey.png";
                      },
                    ),

                  ],
                ),
              ),
              CupertinoButton(child: Text("동물 추가하기"), onPressed: (){
                CupertinoActionSheet actionSheet;
                actionSheet = CupertinoActionSheet(title:Text("추가할까요?"),
                message: Text("동물의 이름은 ${_textController?.value.text}이고, ${getKind(_kind)}종류를 선택하셨네요."),
                  actions: [
                    CupertinoButton(child: Text("네"), onPressed: (){
                      widget.animalList?.add(Animal(
                          animalName: _textController?.value.text,
                          kind: getKind(_kind),
                          imagePath: _imagePath,
                          flyExist: _flyExist
                      ));
                      Navigator.of(context).pop();
                    })
                  ],
                  cancelButton: CupertinoButton(child: Text('아뇨'), onPressed: (){
                    Navigator.of(context).pop();
                  },),
                );
                showCupertinoModalPopup(context: context, builder: (context){
                  return actionSheet;
                });
              })
            ],
          ),
        ),
      ),
    );
  }

  getKind(int value){
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
}