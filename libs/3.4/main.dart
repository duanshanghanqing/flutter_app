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
        "/TextComponent": (context) => TextComponent(),
      },
      // 应用首页路由
      // home: MyHomePage(title: 'Flutter Demo Home Page'), // 设置页面标题
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 状态值
  // 1.该组件的状态。由于我们只需要维护一个点击次数计数器，所以定义一个_counter状态：
  int _counter = 0;

  // 方法
  void _incrementCounter() {
    // 2.设置状态的自增函数。
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置页面导航，并设置标题
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 设置页面内容
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // 文本内容
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter', // 这里显示累加的值，和react比较像
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("TextComponent"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/TextComponent");
              },
            ),
          ],
        ),
      ),
      // floatingActionButton是页面右下角的带“+”的悬浮按钮，它的onPressed属性接受一个回调函数，代表它被点击后的处理器，本例中直接将_incrementCounter方法作为其处理函数。
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 代表它被点击后的处理器
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// 3.3 文本及样式
// https://book.flutterchina.club/chapter3/text.html
class TextComponent extends StatelessWidget {
  TextComponent({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3.4 按钮"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // 文本内容
          children: <Widget>[
            // RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
            RaisedButton(
              child: Text("normal"),
              onPressed: () {},
            ),
            // FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
            FlatButton(
              child: Text("normal"),
              onPressed: () {},
            ),
            // OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)，
            OutlineButton(
              child: Text("normal"),
              onPressed: () {},
            ),
            // IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            // RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: () {},
            ),
            OutlineButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: () {},
            ),
            FlatButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: () {},
            ),
            // 3.4.2 自定义按钮外观
            FlatButton(
              textColor: Colors.white,// 按钮文字颜色
              disabledTextColor: Colors.black,// 按钮禁用时的文字颜色
              color: Colors.blue,//按钮背景颜色
              disabledColor: Colors.black,//按钮禁用时的背景颜色
              highlightColor: Colors.blue[700],//按钮按下时的背景颜色
              splashColor: Colors.red,//点击时，水波动画中水波的颜色
              colorBrightness: Brightness.dark,//按钮主题，默认是浅色主题 
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
