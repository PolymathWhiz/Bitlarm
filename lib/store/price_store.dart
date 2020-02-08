import 'package:shared_preferences/shared_preferences.dart';

class PriceStore {
  SharedPreferences _prefs;
  final String _highPrice = 'high_price';
  final String _lowPrice = 'low_price';

  PriceStore() {
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _setHighPrice(int price) async {
    await _prefs.setInt(PriceStoreKeys.HIGH_PRICE, price);
  }

  _setLowPrice(int price) async {
    await _prefs.setInt(PriceStoreKeys.LOW_PRICE, price);
  }
}

class PriceStoreKeys {
  static const String HIGH_PRICE = 'high_price';
  static const String LOW_PRICE = 'low_price';
}
