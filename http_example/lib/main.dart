import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result ="";
  List? data;
  TextEditingController? _editingController;
  int page=1;
  ScrollController? _scrollController;

  @override
  void initState(){
    super.initState();
    data = new List.empty(growable: true);
    _editingController = new TextEditingController();
    _scrollController = new ScrollController();

    _scrollController!.addListener(() {
      if(_scrollController!.offset>=_scrollController!.position.maxScrollExtent && !_scrollController!.position.outOfRange){
        print("현재 bottom");
        page++;
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: "검색어를 입력하세요"),
        )
      ),
      body: Container(
        child: Center(
          child: data!.length == 0?Text("Empty Data", textAlign: TextAlign.center,):
              ListView.builder(itemBuilder: (context, index){
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Image.network(
                          data![index]['thumbnail'],
                          height: 100,
                          width:100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(data![index]['title'].toString()),
                            Text(data![index]['authors'].toString()),
                            Text(data![index]['sale_price'].toString()),
                            Text(data![index]['status'].toString()),
                          ],
                        ),
                      ),
                    ],
                  )
                );
              }, itemCount: data!.length, controller: _scrollController,)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          page=1;
          data!.clear();
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }
  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_editingController!.value.text}';
    var res = await http.get(Uri.parse(url), headers: {"Authorization" : "KakaoAK ef75bfe5755f6010052252082d152240"});
    setState((){
      var dataJSON = json.decode(res.body);
      List result = dataJSON['documents'];
      data!.addAll(result);
    });

    return res.body;
  }
}


