import 'package:animation_example/main.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class _HeaderDelegate extends SliverPersistentHeaderDelegate{
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _HeaderDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight,minHeight);

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate){
    return maxHeight != oldDelegate.maxHeight ||
    minHeight != oldDelegate.minHeight ||
    child != oldDelegate.child;
  }
}

class SliverPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SliverPage();
}

class _SliverPage extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver Example"),
              background: Image.asset('repo/images/sunny.png'),
            ),
            backgroundColor: Crimson,
            pinned: true,
          ),
          SliverPersistentHeader(delegate: _HeaderDelegate(
            minHeight: 50,
            maxHeight: 150,
            child: Container(
              color:Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'list 숫자',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              )
            )
          ),pinned: true,),
          SliverList(delegate: SliverChildListDelegate([
            customCard('first'),
            customCard('second'),
            customCard('third'),
            customCard('fourth'),
          ])),
          SliverPersistentHeader(delegate: _HeaderDelegate(
              minHeight: 50,
              maxHeight: 150,
              child: Container(
                  color:Colors.blue,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'grid 숫자',
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  )
              )
          ),pinned: true,),
          SliverGrid(delegate: SliverChildListDelegate([
            customCard('first'),
            customCard('second'),
            customCard('third'),
            customCard('fourth'),
          ]), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            return Container(
              child: customCard('list count : $index'),
            );
          },childCount: 10))
        ],
      ),
    );
  }

  Widget customCard(String text){
    return Card(
      child: Container(
        height: 120,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}