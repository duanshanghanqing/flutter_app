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
        title: Text("3.3 文本及样式"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // 文本内容
          children: <Widget>[
            // 3.3.1 Text
            Text("左对齐"),
            Text(
              "Hello world" * 10,
              textAlign: TextAlign.left, // 对齐方式-左对齐
              // style: textStyle,
            ),
            Text("右对齐"),
            Text(
              "Hello world" * 10,
              textAlign: TextAlign.right, // 对齐方式-右对齐
            ),
            Text("居中对齐"),
            Text(
              "Hello world" * 10,
              textAlign: TextAlign.center, // 对齐方式-居中对齐
            ),
            Text("开始方向对象对齐"),
            Text(
              "Hello world" * 10,
              textAlign: TextAlign.start, // 对齐方式-按开始方向对象对齐，和左对齐类似
            ),
            Text("结束方向对象对齐"),
            Text(
              "Hello world" * 10, // 乘以10标识重复次数
              textAlign: TextAlign.end, // 对齐方式-按结束方向对象对齐，和右对齐类似
            ),
            Text(
              "Hello world! I'm Jack. " * 4,
              maxLines: 1, // 文本显示的最大行数
              overflow: TextOverflow.ellipsis, // 文本溢出...
            ),
            Text(
              "Hello world",
              textScaleFactor:
                  5.5, // textScaleFactor：代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的fontSize，它是调整字体大小的一个快捷方式。该属性的默认值可以通过MediaQueryData.textScaleFactor获得，如果没有MediaQuery，那么会默认值将为1.0。
            ),
            // 3.3.2 TextStyle
            Text(
              "Hello world",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow, // 黄色
                  decoration: TextDecoration.underline, // 虚线
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            // 3.3.3 TextSpan
            Text.rich(TextSpan(children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
                // recognizer: _tapRecognizer
              ),
            ])),

            // 3.3.4 DefaultTextStyle,设置默认样式
            DefaultTextStyle(
              //1.设置文本默认样式
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text(
                    "I am Jack",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            // 3.3.5 字体
          ],
        ),
      ),
    );
  }
}
