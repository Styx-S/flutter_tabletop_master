import 'package:flutter/material.dart';
import 'package:flutter_tabletop_master/debugConsole/debugConsole.dart';

class DebugConsoleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DebugConsoleState();
  }
}

class _DebugConsoleState extends State<DebugConsoleWidget> {
  bool hidden = true;
  List<String> _strs = List<String>.empty(growable: true);
  TextEditingController _consoleInputCtrl = TextEditingController();
  ScrollController _consoleScrollCtrl = ScrollController();

  _DebugConsoleState() {
    DebugConsole().registerConsoleHiddenCallback((hidden) {
      setState(() {
        this.hidden = hidden;
      });
    });

    DebugConsole().registerInfoCallback((str) {
      setState(() {
        _strs.add(str);
      });
    });
    _strs.add("console init...");
  }

  @override
  Widget build(BuildContext context) {


    return Visibility(
        visible: !hidden,
        child: Material(
            child: Container(
          color: Colors.green,
          width: 1000,
          height: 500,
          child: Column(children: [
            Row(
              children: [
                Expanded(child: Column(children: [Text("Debug Console")])),
                // 关闭按钮
                IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 32,
                    onPressed: () {
                      setState(() {
                        hidden = true;
                      });
                    }),
              ],
            ),
            Expanded(child: ListView.builder(
              itemCount: _strs.length,
              controller: _consoleScrollCtrl,
              itemBuilder: (BuildContext context, int index){
                return Text(_strs[index]);
            })),
            Row(
              children: [
                Expanded(child: TextField(controller: _consoleInputCtrl)),
                TextButton(onPressed: (){
                  if (_consoleInputCtrl.text.length > 0) {
                    DebugConsole().inputCommand(_consoleInputCtrl.text);
                    _consoleInputCtrl.clear();
                  }
                }, child: Text("输入"))
              ],
            ),
          ]),
        )));
  }
}
