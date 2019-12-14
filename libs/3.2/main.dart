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
        "/TapboxA": (context) => TapboxA(),
        "/ParentWidget": (context) => ParentWidget(),
        "/ParentWidgetC": (context) => ParentWidgetC(),
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
              child: Text("TapboxA"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/TapboxA");
              },
            ),
            FlatButton(
              child: Text("ParentWidget"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/ParentWidget");
              },
            ),
            FlatButton(
              child: Text("ParentWidgetC"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/ParentWidgetC");
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

// TapboxA 管理自身状态.
//------------------------- TapboxA ----------------------------------
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  // 定义_active：确定盒子的当前颜色的布尔值。
  bool _active = false;

  // 定义_handleTap()函数，该函数在点击该盒子时更新_active，并调用setState()更新UI。
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive', // 设置显示字体
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600], // 设置北京颜色
        ),
      ),
    );
  }
}

// 3.2.2 父Widget管理子Widget的状态
// ParentWidget 为 TapboxB 管理状态.
//------------------------ ParentWidget --------------------------------
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

// 父Widget管理子状态
class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false; // 定义状态
  // 切换状态
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      // 把父状态传递到子组件内
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------
// 因为状态是在父组件维护，所以子组件继承的是无状态组件
class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  // 接收传入的参数
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  // 组件切换样式逻辑
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

// 3.2.3 混合状态管理
// 对于一些组件来说，混合管理的方式会非常有用。在这种情况下，组件自身管理一些内部状态，而父组件管理一些其他外部状态。
//---------------------------- ParentWidget ----------------------------
class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      // 把父组件状态传给子组件
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------
// 因为子组件需要实现一个按下屏幕，出现边框，松开边框消失的效果，需要自己维护一个显示边框的状态，所以这里继承的 有状态组件
class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  // 接收参数
  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  // 子组件维护是否显示边框状态的样式，默认不显示
  bool _highlight = false;

  // 设置显示的方法
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  // 设置效数的方法
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

// 设置效数的方法
  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  // 调用父类的方法
  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          // 切换边框样式
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
