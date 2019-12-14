import 'package:flutter/material.dart';

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
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置页面导航，并设置标题
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ClipRRect(
        // 设置圆角
        borderRadius: BorderRadius.all(Radius.circular(15)),
        // Column(): 垂直布局
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _item(context, 1.0),
            _item(context, 1.0),
            _item(context, 0),
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, double bottomWidth) {
    return Container(
      // double.infinity ： 撑满
      width: double.infinity,
      height: 60,
      // 设置装饰器
      decoration: BoxDecoration(
        // 边色与边宽度
        // border: Border.all(color: Color(0xFFFF0000), width: 0.5),
        // 设置指定边框样式
        border: Border(
          bottom: BorderSide(
            // 设置边框宽度
            width: bottomWidth,
            // 设置边框颜色
            color: Colors.red,
          ),
        ),
        // 设置背景渐变
        gradient: LinearGradient(
          // 渐变开始颜色，渐变结束颜色
          colors: [Colors.amberAccent, Colors.lightBlue],
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Text('1'),
            ),
          ),
          Expanded(
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Text('2'),
            ),
          ),
          Expanded(
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              child: Text('3'),
            ),
          ),
        ],
      ),
    );
  }
}
