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
        "context_route": (context) => ContextRoute(),
        "counter_widget": (context) => CounterWidget(),
        "widget_get": (context) => WidgetGet(),
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
            Echo(text: "hello world"),
            FlatButton(
              child: Text("context_route"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "context_route");
              },
            ),
            FlatButton(
              child: Text("counter_widget"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "counter_widget");
              },
            ),
            FlatButton(
              child: Text("widget_get"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "widget_get");
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

// 3.1.4 StatelessWidget: 无状态组件，它继承自Widget类，重写了createElement()方法
// StatelessWidget用于不需要维护状态的场景，它通常在build方法中通过嵌套其它Widget来构建UI，在构建过程中会递归的构建其嵌套的Widget。
class Echo extends StatelessWidget {
  Echo({
    Key key, // 在继承widget时，第一个参数通常应该是Key，
    @required
        this.text, // 构造函数参数应使用命名参数，命名参数中的必要参数要添加@required标注,这样有利于静态代码分析器进行检查。
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text; // Widget的属性应尽可能的被声明为final，防止被意外改变。
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

// Context
class ContextRoute extends StatelessWidget {
  // 它是BuildContext类的一个实例，表示当前widget在widget树中的上下文，每一个widget都会对应一个context对象（因为每一个widget都是widget树上的一个节点）。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Context测试"),
      ),
      body: Container(
        child: Builder(builder: (context) {
          // 在Widget树中向上查找最近的父级`Scaffold` widget
          Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
          // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}

// 3.1.5 StatefulWidget
// 和StatelessWidget一样，StatefulWidget也是继承自Widget类，并重写了createElement()方法，不同的是返回的Element 对象并不相同；另外StatefulWidget类中添加了一个新的接口createState()。
// 继承StatefulWidget,是一个有状态组件
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;
  // 重写创建状态组件
  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

// 什么build()方法放在State（而不是StatefulWidget）中 ？
// 这主要是为了提高开发的灵活性。

// 如果将build()方法在StatefulWidget中则会有两个问题：
// 1.状态访问不便。

// 定义状态组件 _CounterWidgetState 继承自 State，类型为 CounterWidget 类型
class _CounterWidgetState extends State<CounterWidget> {
  int _counter; // initValue整型参数，它表示计数器的初始值。

  // 初始化调用
  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState=$_counter");
  }

  // 主要是用于构建Widget子树的，会在如下场景被调用：
  // 在调用initState()之后。
  // 在调用didUpdateWidget()之后。
  // 在调用setState()之后。
  // 在调用didChangeDependencies()之后。
  // 在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed: () => setState(
            () => ++_counter,
          ),
        ),
      ),
    );
  }

  // 在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  // 当State对象从树中被移除时，会调用此回调。在一些场景下，Flutter framework会将State对象重新插到树中，如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。
  // 如果移除后没有重新插入到树中则紧接着会调用dispose()方法。
  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  // 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  // build() 中InheritedWidget发生了变化，那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。
  // 典型的场景是当系统语言Locale或应用主题改变时，Flutter framework会通知widget调用此回调。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

// 3.1.7 在Widget树中获取State对象
class WidgetGet extends StatefulWidget {
  WidgetGet({Key key});

  // 重写创建状态组件
  @override
  _WidgetGetState createState() => new _WidgetGetState();
}

class _WidgetGetState extends State<WidgetGet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              // 查找父级最近的Scaffold对应的ScaffoldState对象
              // ScaffoldState _state = context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
              // 直接通过of静态方法来获取ScaffoldState
              ScaffoldState _state = Scaffold.of(context);
              //调用ScaffoldState的showSnackBar来弹出SnackBar
              // 显示底部弹框
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar"),
                ),
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}
