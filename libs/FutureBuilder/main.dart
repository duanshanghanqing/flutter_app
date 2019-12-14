/*
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 注册路由表,实现路由注册
      routes: {
        "/": (context) => MyPage(), //注册首页路由
      },
      // 应用首页路由
      // home: MyHomePage(title: 'Flutter Demo Home Page'), // 设置页面标题
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  //工厂方法
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        icon: json["icon"],
        title: json["title"],
        url: json["url"],
        statusBarColor: json["statusBarColor"],
        hideAppBar: json["hideAppBar"]);
  }
}

// http
Future<CommonModel> fetchPost() async {
  var response = await http
      .get('https://www.devio.org/io/flutter_app/json/test_common_model.json');
  var utf8Decoder = convert.Utf8Decoder(); // 中文转码
  // 将相应结果转换成dart对象
  var jsonResponse =
      convert.jsonDecode(utf8Decoder.convert(response.bodyBytes));
  return CommonModel.fromJson(jsonResponse);
}
// context ： 上下文
// snapshot： 快照
Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
  switch (snapshot.connectionState) {
    case ConnectionState.none:
      return Text("Input a url to connect");
      break;
    case ConnectionState.waiting:
      //圆形加载widget
      return Center(child: CircularProgressIndicator());
      break;
    case ConnectionState.active:
      return Text("");
      break;
    case ConnectionState.done:
      // 加载完成
      if (snapshot.hasError) {
        return Text(
          "${snapshot.error}",
          style: TextStyle(color: Colors.red),
        );
      } else {
        //正常数据返回回调
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "网络数据返回",
              style: TextStyle(fontSize: 20),
            ),
            Text("title:${snapshot.data.title}"),
            Text("icon:${snapshot.data.icon}"),
            Text("url:${snapshot.data.url}"),
          ],
        );
      }
      break;
    default:
      return null;
  }
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchPost(), //网络请求操作
        builder: _buildFuture,
      ),
    );
  }
}
*/