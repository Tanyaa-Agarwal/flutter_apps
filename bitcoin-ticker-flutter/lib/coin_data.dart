import 'dart:convert';
import 'package:http/http.dart'as http;

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
const coinAPIURL ='https://free.currconv.com/api/v7/convert?q=PHP_USD&compact=ultra';
const apiKey='f2078dd413914198b016';
class CoinData {
  Future getcoindata() async{
    String requesturl= '$coinAPIURL&apiKey=$apiKey';
    http.Response response= await http.get(requesturl);
    if(response.statusCode==200)
      {
        var decodeData =jsonDecode(response.body);
        var rate =decodeData['PHP_USD'];
        if(rate!=null){
          return rate.toStringAsFixed(0);
        }
        else
          return '0';
      }
    else
      {
        print(response.statusCode);
        throw 'Problem with the get request';
      }

  }
}
