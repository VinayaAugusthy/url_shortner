import 'package:flutter/foundation.dart';

class UrlShorteningModel extends ChangeNotifier {
  String shortenLink = '';

  void setShortenLink(String link) {
    shortenLink = link;
    notifyListeners();
  }
}
