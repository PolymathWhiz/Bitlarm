import 'package:shared_preferences/shared_preferences.dart';

class PriceStore {
  SharedPreferences _prefs;

  PriceStore() {
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  setHighPrice(int price) async {
    await _prefs.setInt(PriceStoreKeys.HIGH_PRICE, price);
  }

  setLowPrice(int price) async {
    await _prefs.setInt(PriceStoreKeys.LOW_PRICE, price);
  }

  getHighPrice() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt(PriceStoreKeys.HIGH_PRICE) ?? 0;
  }

  getLowPrice() async {
    return _prefs.getInt(PriceStoreKeys.LOW_PRICE) ?? 0;
  }
}

class PriceStoreKeys {
  static const String HIGH_PRICE = 'high_price';
  static const String LOW_PRICE = 'low_price';
}
