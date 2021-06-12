
import 'dart:io';

class Client {
  static Client get instance => _getInstance();
  static Client? _instance;
  static Client _getInstance() {
    if (_instance == null) {
      _instance = new Client._internal();
    }
    return _instance!;
  }
  Client._internal();

  var _httpClient = HttpClient();

  void CreateRoomAndJoin() {
    
  }
  

}