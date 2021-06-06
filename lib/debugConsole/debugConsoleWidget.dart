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

  _DebugConsoleState() {
    DebugConsole().registerConsoleHiddenCallback((hidden) {
      setState(() {
        this.hidden = hidden;
      });
    });

    DebugConsole().registerInfoCallback((str) {});
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
            Row(),
            Row(),
          ]),
        )));
  }
}
