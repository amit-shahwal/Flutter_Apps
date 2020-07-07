import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  String Heading = "WELCOME TO THE NEWS APP MADE WITH ❤";
  String Content =
      "THIS HAS HIGHLY CUSTOMIZABLE FEATURES WITH NEXT AND PREVIOUS SUPPORT";
  String Description =
      "TO PROCEED AND TO ENJOY TO THE GREATER EXTEN OF NEWS CONTINUE BY TAPPING NEXT";
  int i = 0;

  Future<dynamic> getusadtat(int i) async {
    var url = 'https://newontheair.herokuapp.com/api';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // print(jsonResponse['data']['articles'][2]['title']);
      return jsonResponse;

//      setState(() {
//        Heading = jsonResponse['data']['articles'][0]['title'];
//        Description = jsonResponse['data']['articles'][0]['description'];
//        Description = jsonResponse['data']['articles'][0]['content'];
//      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('News App')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Heading,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xFFd7ffd9),
                        ),
                      ),
                    ),
                  ),
//                    Text(Description),
//                    Text(Content)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'DESCRIPTION:-  $Description',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,

                          //color: Color(0xFFd7ffd9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var k = await getusadtat(2);
                      //  print(k['data']['articles'][2]['title']);
                      setState(() {
                        if ((k['data']['articles'][i]['title']) == null)
                          Heading = 'SORRY';
                        else
                          Heading = k['data']['articles'][i]['title'];

                        if ((k['data']['articles'][i]['content']) == null)
                          Content = 'SORRY😢😢, NO CONTENT!';
                        else
                          Content = k['data']['articles'][i]['content'];

                        if ((k['data']['articles'][i]['description']) == null)
                          Description = 'SORRY';
                        else
                          Description = k['data']['articles'][i]['description'];
                        if (i != 0) i--;
                      });
                    },
                    child: Text(
                      'PREV',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var k = await getusadtat(2);

                      print(k['data']['articles'][2]['title']);
                      setState(() {
                        if ((k['data']['articles'][i]['title']) == null)
                          Heading = 'SORRY';
                        else
                          Heading = k['data']['articles'][i]['title'];

                        if ((k['data']['articles'][i]['content']) == null)
                          Content = 'SORRY😢😢, NO CONTENT!';
                        else
                          Content = k['data']['articles'][i]['content'];

                        if ((k['data']['articles'][i]['description']) == null)
                          Description = 'SORRY';
                        else
                          Description = k['data']['articles'][i]['description'];

                        i++;
                      });
                    },
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text('Made By:- Amit Shahwal'),
                Text('API:-https://newontheair.herokuapp.com/'),
              ],
            ),
          )
          // Expanded(),
        ],
      ),
    );
  }
}
