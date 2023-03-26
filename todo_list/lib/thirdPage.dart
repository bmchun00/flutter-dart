import 'package:flutter/material.dart';

class ThirdDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final String args = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body: Container(
        child: Center(
          child: Text(
            args,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}