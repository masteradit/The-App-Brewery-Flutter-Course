import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '839EB29A-5B71-4EFC-BB6C-5E4D17CD2DFC';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    for (String crypto in cryptoList) {
      String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    //TODO 5: Return a Map of the results instead of a single value.
  }
}
