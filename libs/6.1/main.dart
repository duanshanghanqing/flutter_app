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
        "/ClipTestRoute": (context) => ClipTestRoute(),
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
              child: Text("ClipTestRoute"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/ClipTestRoute");
              },
            )
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

class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),

            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry D')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry E')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry F')),
            ),

            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry G')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry F')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry H')),
            ),

            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry S')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry Y')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry Z')),
            ),

            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry S1')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry Y2')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry Z3')),
            ),
          ],
        ));
  }
}
