typedef void DebugInfoCallback(String str);
typedef void DebugConsoleHiddenCallback(bool hidden);
typedef void DebugCommandHandler(String cmd);

class DebugConsole {
  factory DebugConsole() => _getInstance();
  static DebugConsole get instance => _getInstance();
  static DebugConsole? _instance;
  static DebugConsole _getInstance() {
    if (_instance == null) {
      _instance = new DebugConsole._internal();
    }
    return _instance!;
  }
  DebugConsole._internal();

  DebugInfoCallback? _debugInfoCallback;
  DebugConsoleHiddenCallback? _consoleHiddenCallback;
  List<DebugCommandHandler> handlers = List<DebugCommandHandler>.empty(growable: true);
  void registerInfoCallback(DebugInfoCallback callback) {
    _debugInfoCallback = callback;
  }
  void registerConsoleHiddenCallback(DebugConsoleHiddenCallback callback) {
    _consoleHiddenCallback = callback;
  }


  void debugInfo(String str) {
    if (_debugInfoCallback == null) {
      return;
    }

    _debugInfoCallback!(str);
  }

  void showConsole() {
    if (_consoleHiddenCallback == null) {
      return;
    }
    _consoleHiddenCallback!(false);
  }

  void hideConsole() {
    if (_consoleHiddenCallback == null) {
      return;
    }
    _consoleHiddenCallback!(true);
  }

  void inputCommand(String cmd) {
    for (var h in handlers) {
      h(cmd);
    }

    debugInfo("\$ " + cmd);
  }

  void regsiterCommandHandler(DebugCommandHandler handler) {
    handlers.add(handler);
  }

}

