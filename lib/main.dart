import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tabletop_master/debugConsole/debugConsole.dart';

import 'debugConsole/debugConsoleWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(children: <Widget>[
        MyHomePage(title: 'Tabletop Master (Flutter) | 桌游大师'),
        DebugConsoleWidget(),
      ]),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
            onPressed: () {},
            child: Text("创建房间"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("加入房间"),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: Text("退出游戏"),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        DebugConsole().showConsole();
      }),
    );
  }
}
