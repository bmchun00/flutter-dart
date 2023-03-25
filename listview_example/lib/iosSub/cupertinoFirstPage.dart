import 'package:flutter/cupertino.dart';
import '../animalItem.dart';

class CupertinoFirstPage extends StatelessWidget{
  final List<Animal> animalList;

  const CupertinoFirstPage({Key? key, required this.animalList}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
      middle: Text("동물 리스트 (Cupertino!)")
    ),
        child: ListView.builder(itemBuilder: (context,index){
      return Container(
        padding: EdgeInsets.all(5),
        height: 100,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  animalList[index].imagePath!,
                  fit:BoxFit.contain,
                  width: 80,
                  height: 80,
                ),
                Text(animalList[index].animalName!)
              ],
            ),
            Container(
              height: 1.5,
              color: CupertinoColors.inactiveGray,
            )
          ],
        ),
      );
    },
          itemCount: animalList.length,)
    );
  }
}