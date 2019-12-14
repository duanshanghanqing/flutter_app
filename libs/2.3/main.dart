/*
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // 引入english_words包。

void main() => runApp(MyApp());

// StatefulWidget类，表示它是一个有状态的组件
// StatelessWidget类，表示它是一个无状态的组件

class MyApp extends StatelessWidget {
  // Flutter在构建页面时，会调用组件的build方法，widget的主要工作是提供一个build()方法来描述如何构建UI界面（通常是通过组合、拼装其它基础widget）。
  @override
  Widget build(BuildContext context) {
    // 接收组件上下文
    // MaterialApp 是Material库中提供的Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
    return MaterialApp(
        // 应用名称
        title: 'Flutter Demo',
        theme: ThemeData(
          // 蓝色主题
          primarySwatch: Colors.blue,
        ),
        // 注册路由表,实现路由注册
        routes: {
          "/": (context) =>
              MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
        },
        // 2.2.6 路由生成钩子
        onGenerateRoute: (RouteSettings settings) {
          var materialPageRoute = MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            // 引导用户登录；其它情况则正常打开路由。
            print(routeName);
            return;
          });
          return materialPageRoute;
        }
        // 应用首页路由
        // home: MyHomePage(title: 'Flutter Demo Home Page'), // 设置页面标题
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
            RandomWordsWidget(),
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

// 参考链接
// https://book.flutterchina.club/chapter2/flutter_package_mgr.html
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 这里使用导入的软件包
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}
*/
