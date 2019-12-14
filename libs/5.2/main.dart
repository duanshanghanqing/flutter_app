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
        "/PaddingTestRoute": (context) => PaddingTestRoute(),
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
              child: Text("5.2 尺寸限制类容器"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/PaddingTestRoute");
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

class PaddingTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 定义一个 盒子
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );

    return Scaffold(
        // 设置页面导航，并设置标题
        appBar: AppBar(
          title: Text("5.2 尺寸限制类容器"),
          actions: <Widget>[
              UnconstrainedBox(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(Colors.white70),
                  ),
                ),
              )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ConstrainedBox用于对子组件添加额外的约束。
            // 例如，如果你想让子组件的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子组件的约束。
            // BoxConstraints用于设置限制条件，
            ConstrainedBox(
              // 设置对子元素的约束
              constraints: BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0, //最小高度为50像素
              ),
              child: redBox,
            ),

            // SizedBox用于给子元素指定固定的宽高，
            SizedBox(width: 80.0, height: 80.0, child: redBox),

            // 实际上SizedBox只是ConstrainedBox的一个定制，上面代码等价于：
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
              child: redBox, 
            ),

            // 而BoxConstraints.tightFor(width: 80.0,height: 80.0)等价于：
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 80.0,
                maxHeight: 80.0,
                minWidth: 80.0,
                maxWidth: 80.0
              ),
              child: redBox,
            ),

            // 5.2.3 多重限制
            // 我们发现有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                  child: redBox,
                )
            ),

            // 5.2.4 UnconstrainedBox
            // UnconstrainedBox不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制。一般情况下，我们会很少直接使用此组件，但在"去除"多重限制的时候也许会有帮助，
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
              child: UnconstrainedBox( //“去除”父级限制
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                  child: redBox,
                ),
              )
            )
          ],
        ));
  }
}
