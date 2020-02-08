import 'package:bitlarm/price_sheet.dart';
import 'package:flutter/material.dart';

class PriceIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PriceIndexState();
}

class _PriceIndexState extends State<PriceIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Bitlarm"),
        ),
        body: SafeArea(
          bottom: true,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "USD 120,000",
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
                      );
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
}
