import 'package:bitlarm/price_sheet.dart';
import 'package:bitlarm/store/price_store.dart';
import 'package:flutter/material.dart';

class PriceIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PriceIndexState();
}

class _PriceIndexState extends State<PriceIndex> {
  PriceStore priceStore = PriceStore();

  int price;

  @override
  void initState() {
    super.initState();
    _retrieveHighPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Bitlarm"),
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "\$120,000",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "1 Bitcoin Price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Your current high price is \$$price",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    color: Colors.blue,
                    onPressed: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return PriceSheet();
                        },
                      ).whenComplete(() async {
                        await _retrieveHighPrice();
                      });

                      setState(() {});
                    },
                    child: Text(
                      "Set Price",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _retrieveHighPrice() async {
    price = await priceStore.getHighPrice();
    setState(() {
      price = price;
    });
  }
}
