//TODO: Add your imports here.
import 'package:http/http.dart' as http;
import 'dart:convert';

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

const coinAPIURL = 'https://free.currconv.com/api/v7/convert';
const apiKey = 'f2078dd413914198b016';

class CoinData {
  //TODO: Create your getCoinData() method here.
  Future getCoinData(String selectedCurrency,String crypto) async {

      String requestURL = '$coinAPIURL?q=${crypto}_$selectedCurrency&compact=ultra&apiKey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var price = decodedData['${crypto}_$selectedCurrency'];
         return price;
      }
      else {
        print(response.statusCode);
        throw 'Problem with get request';
      }


    }
  }

