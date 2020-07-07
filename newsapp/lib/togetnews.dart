import 'package:http/http.dart' as http;

import 'dart:convert' as convert;
import 'networking.dart';

class Newsdata {
  String Heading;
  String Description;
  String Content;
  Future<dynamic> getusadtat() async {
    var url = 'https://newontheair.herokuapp.com/api';
    NetworkHelper networkHelper = NetworkHelper(url);
    // Await the http get response, then decode the json-formatted response.
    var newsData = await networkHelper.getData();
    return newsData;
  }
}
