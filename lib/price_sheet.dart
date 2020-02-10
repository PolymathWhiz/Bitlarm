import 'package:bitlarm/store/price_store.dart';
import 'package:flutter/material.dart';

class PriceSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PriceSheetState();
}

class _PriceSheetState extends State<PriceSheet> {
  final priceController = TextEditingController();
  bool _priceValidate = false;
  int price;

  PriceStore priceStore = PriceStore();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        margin: EdgeInsets.all(5),
        child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  width: 100,
                  height: 6,
                  decoration: new BoxDecoration(
                    color: Colors.grey[400].withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
                SizedBox(height: 10),

                // Container(
                //   alignment: Alignment.topLeft,
                //   child: Text("Set price alert amount",
                //       style: TextStyle(
                //           fontSize: 16.0, fontWeight: FontWeight.w600)),
                // ),
                SizedBox(height: 10),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Set price alert amount",
                    border: OutlineInputBorder(),
                    errorText:
                        _priceValidate == true ? 'Price cannot be empty' : null,
                  ),
                  maxLength: 6,
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    if (_validateForm()) {
                      _saveHighPrice(price);
                      Navigator.pop(context);
                    }
                    setState(() {});
                  },
                  child: Text(
                    "Update Price",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )));
  }

  bool _validateForm() {
    bool valid = true;

    String enteredPrice = priceController.text.trim().toString();

    if (enteredPrice.isEmpty) {
      _priceValidate = true;
      valid = false;
    } else {
      _priceValidate = false;
      price = int.parse(enteredPrice);
    }

    return valid;
  }

  _saveHighPrice(int amount) async {
    await priceStore.setHighPrice(amount);
  }
}
