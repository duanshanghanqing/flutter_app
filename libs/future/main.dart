import 'package:flutter/material.dart';
import 'dart:async';

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

// 1.future.then使用
Future<String> testFuture() {
  return Future.value('success');
  // return Future.error('error');
}

// 2.async和await使用
void test() async {
  // Future.delayed：睡20s
  var result = await Future.delayed(
    Duration(milliseconds: 2000),
    () => Future.value("hahha"),
  );
  print("time = ${DateTime.now()}");
  print(result);
}

void testWhenComplete() {
  Future.error("yxjie make a error")
      .then(print)
      .catchError(print)
      .whenComplete(() => print("Done!!!"));
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // 文本内容
          children: <Widget>[
            FlatButton(
              child: Text("1.future.then使用"),
              textColor: Colors.blue,
              onPressed: () {
                testFuture().then((s) {
                  print(s);
                }, onError: ((e) {
                  // 捕获错误
                  print(e);
                })).catchError((e) {
                  // 捕获错误
                  print('catchError');
                  print(e);
                });
              },
            ),
            FlatButton(
              child: Text("2.async和await使用"),
              textColor: Colors.blue,
              onPressed: () {
                print("time start = ${DateTime.now()}");
                test();
                print("time end= ${DateTime.now()}");
                // I/flutter (25419): time start = 2019-11-12 01:54:29.392605
                // I/flutter (25419): time end= 2019-11-12 01:54:29.394074
                // I/flutter (25419): time = 2019-11-12 01:54:31.398776
                // I/flutter (25419): hahha
              },
            ),
            FlatButton(
              child: Text("3.future.whenComplete使用"),
              textColor: Colors.blue,
              onPressed: () {
                // 此方法类似于java中try{}catch(){}finally{}异常捕获的finally
                Future.error("yxjie make a error")
                    .then(print)
                    .catchError(print)
                    .whenComplete(() => print("Done!!!"));
                // Reloaded 1 of 576 libraries in 328ms.
                // I/flutter (25419): yxjie make a error
                // I/flutter (25419): Done!!!
              },
            ),
            FlatButton(
              child: Text("4.future.timeout使用"),
              textColor: Colors.blue,
              onPressed: () {
                Future.delayed(Duration(milliseconds: 3000), () => "hate")
                    .timeout(Duration(milliseconds: 2000))// 超过2000毫秒抛异常
                    .then(print)
                    .catchError(print);
                    //TimeoutException after 0:00:00.002000: Future not completed
              },
            ),
          ],
        ),
      ),
    );
  }
}
