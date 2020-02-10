class Util {
  final String productionUrl = "https://rest.coinapi.io/";
  final String sandboxUrl = "https://rest-sandbox.coinapi.io/";
  final String btcUsdUrl =
      "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=AAAAE019-7448-482F-9866-BA8A5AE1A0E0";

  getProductionURL() {
    return this.productionUrl;
  }

  getSandboxURL() {
    return this.sandboxUrl;
  }

  getBtcUSDURL() {
    return this.btcUsdUrl;
  }
}
