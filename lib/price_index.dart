import 'package:bitlarm/podo/response.dart';
import 'package:bitlarm/price_sheet.dart';
import 'package:bitlarm/store/price_store.dart';
import 'package:bitlarm/util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PriceIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PriceIndexState();
}

class _PriceIndexState extends State<PriceIndex> {
  PriceStore priceStore = PriceStore();

  int price;

  String btcPrice;

  Util util = Util();

  @override
  void initState() {
    super.initState();
    // _fetchCurrentPrice();
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
                  FutureBuilder(
                      future: _fetchCurrentPrice(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return CircularProgressIndicator();

                          case ConnectionState.active:
                            return CircularProgressIndicator();

                          case ConnectionState.waiting:
                            return CircularProgressIndicator();

                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Text(
                                '${snapshot.error}',
                                style: TextStyle(color: Colors.red),
                              );
                            } else {
                              print(btcPrice);
                              return Text(
                                btcPrice == null ? "" : btcPrice,
                                style: TextStyle(fontSize: 30.0),
                              );
                            }
                        }
                      }),
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
                    "Your high price is current set at \$$price",
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

  _fetchCurrentPrice() async {
    var responseData = await http.get(util.getBtcUSDURL());

    if (responseData.statusCode == 200) {
      // print('Response body: ${responseData.body}');
      final response = responseFromJson(responseData.body);
      setState(() {
        btcPrice = "\$${response.rate.toString()}";
      });
    } else {
      return print("An error occurred! ${responseData.statusCode}");
    }
  }
}
