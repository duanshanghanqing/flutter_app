/*
import 'package:flutter/material.dart';
import 'package:flutter_app/json_to_dart/Autogenerated.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => MyPage(),
      },
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var json = '''
    {
    "success": true,
    "errors": null,
    "data": [
        {
            "id": "ff8080816b40e36c016b4146fbcf0117",
            "accountId": "ff808081661eaf7001661f2c0ede0289",
            "moduleCode": "personal_application",
            "orderNumber": 1
        },
        {
            "id": "ff8080816b40e36c016b4146fbcf0118",
            "accountId": "ff808081661eaf7001661f2c0ede0289",
            "moduleCode": "recommend_site",
            "orderNumber": 2
        },
        {
            "id": "ff8080816b40e36c016b4146fbcf0119",
            "accountId": "ff808081661eaf7001661f2c0ede0289",
            "moduleCode": "recommend_pi",
            "orderNumber": 3
        },
        {
            "id": "ff8080816b40e36c016b4146fbcf011a",
            "accountId": "ff808081661eaf7001661f2c0ede0289",
            "moduleCode": "project_clue",
            "orderNumber": 4
        }
    ]
}
  ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("json_to_dart"),
          textColor: Colors.blue,
          onPressed: () {
            // https://javiercbk.github.io/json_to_dart/
            var data = Data(
                id: "ff8080816b40e36c016b4146fbcf011a",
                accountId: "ff808081661eaf7001661f2c0ede0289",
                moduleCode: "project_clue",
                orderNumber: 4);

            var jsonStr =
                Autogenerated(success: true, errors: null, data: [data])
                    .toJson();
            print(jsonStr);

            // var gifts = Map();
            // gifts['success'] = true;
            // gifts['errors'] = null;
            // // gifts['data'] = [];
            // print(Autogenerated.fromJson(gifts));
          },
        ),
      ),
    );
  }
}
*/