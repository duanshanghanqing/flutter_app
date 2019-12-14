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
        "/ProgressIndicator": (context) => ProgressIndicator(),
        "/CenterColumnRoute": (context) => CenterColumnRoute(),
        "/ContainerColumnRoute": (context) => ContainerColumnRoute(),
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
              child: Text("4.2 线性布局（Row和Column）"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/ProgressIndicator");
              },
            ),
            FlatButton(
              child: Text("Column 居中"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/CenterColumnRoute");
              },
            ),
            FlatButton(
              child: Text("特殊情况"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/ContainerColumnRoute");
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

class ProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("4.2 线性布局（Row和Column）"),
        ),
        body: Column(
          // crossAxisAlignment：表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度
          // 测试Row对齐方式，排除Column默认居中对齐的干扰
          crossAxisAlignment:
              CrossAxisAlignment.start, // crossAxisAlignment.start指顶部对齐
          children: <Widget>[
            Row(
              // MainAxisAlignment.start表示沿textDirection的初始方向对齐，如textDirection取值为TextDirection.ltr时，则MainAxisAlignment.start表示左对齐，textDirection取值为TextDirection.rtl时表示从右对齐。
              // MainAxisAlignment.end和MainAxisAlignment.start正好相反；MainAxisAlignment.center表示居中对齐。
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              // mainAxisAlignment：表示子组件在Row所占用的水平空间内对齐方式，如果mainAxisSize值为MainAxisSize.min，则此属性无意义，因为子组件的宽度等于Row的宽度。只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义，
              // mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，所以对齐是无意义的，所以会从左往右显示
              mainAxisSize: MainAxisSize.min, // 无意义
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              // 表示子组件在纵轴方向的对齐方式，
              crossAxisAlignment: CrossAxisAlignment.start,
              // verticalDirection：表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
              verticalDirection: VerticalDirection.up, // 居下对齐
              children: <Widget>[
                Text(
                  " hello world ",
                  style: TextStyle(fontSize: 30.0), // 字体大小
                ),
                Text(" I am Jack "),
              ],
            ),
          ],
        ));
  }
}

class CenterColumnRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Column[列] 居中"),
        ),
        // Column : 设置 CrossAxisAlignment.center 使文本水平居中对齐
        body: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, // 居中对齐，总宽度为Column占用空间的实际宽度，而实际的宽度取决于子项中宽度最大的Widget。
          children: <Widget>[
            Text("hi"),
            Text("hello world hello world hello world") // 字体大小),
          ],
        ));
  }
}

class ContainerColumnRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Column[列] 居中"),
        ),
        // Container: 类似 div
        body: new Row(
          // mainAxisAlignment: MainAxisAlignment.center,// 水平居中对齐
          // mainAxisAlignment: MainAxisAlignment.start,// 水平居起始位置对齐
          // mainAxisAlignment: MainAxisAlignment.end,// 水平居接收位置对齐
          // mainAxisAlignment: MainAxisAlignment.spaceAround, // 使起始，结束位置的空白区相等，中间空白区是两边2倍，
          // mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右两端对齐
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 将主轴方向上的空白区域均分，使得children之间的空白区域相等
          children: <Widget>[
            Container(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                        children: <Widget>[
                          Text("hello world "),
                          Text("I am Jack "),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                  children: <Widget>[
                    // Row、Column、Flex会被Expanded撑开，充满主轴可用空间。
                    Expanded(
                      child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                        children: <Widget>[
                          Text("hello world "),
                          Text("I am Jack "),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
