import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LargeFileMain extends StatefulWidget{
  @override

  State<StatefulWidget> createState() => _LargeFileMain();
}

class _LargeFileMain extends State<LargeFileMain>{
  final imgUrl =
      'https://images.pexels.com/photos/240040/pexels-photo-240040.jpeg'
      '?auto=compress';
  bool downloading = false;
  var progressString="";
  String file = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Large File Download Example"),
      ),
      body: Center(
        child: downloading? Container(
          height: 120,
          width: 200,
          child: Card(
            color: Colors.black,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text('Downloading File : $progressString', style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        )
            : FutureBuilder(builder: (context, snapshot){
              switch (snapshot.connectionState){
                case ConnectionState.none:
                  print('none');
                  return Text("데이터 없음");
                case ConnectionState.waiting:
                  print('waiting');
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  print('active');
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  print('done');
                  if(snapshot.hasData){
                    return snapshot.data as Widget;
                  }
              }
              print('end process');
              return Text('no data');
        },
        future: downloadWidget(file),)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          downloadFile();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<void> downloadFile() async{
    Dio dio = Dio();
    try{
      var dir = await getApplicationDocumentsDirectory();
      await dio.download('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg','${dir.path}/myimage.jpg',
      onReceiveProgress: (rec,total){
        print('Rec : $rec, Total : $total');
        file = '${dir.path}/myimage.jpg';
        setState(() {
          downloading = true;
          progressString = ((rec/total)*100).toStringAsFixed(0) + '%';
        });
      }
      );
    }catch(e){
      print(e);
    }
    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print('Download Successful');
  }

  Future<Widget> downloadWidget(String filePath) async{
    File file = File(filePath);
    bool exist = await file.exists();
    new FileImage(file).evict();

    if(exist){
      return Center(
        child: Column(
          children: <Widget>[Image.file(File(filePath))],
        ),
      );
    }else{
      return Text('No data');
    }
  }
}