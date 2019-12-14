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
        "/ListView1": (context) => ListView1(),
        "/ListView2": (context) => ListView2(),
        "/ListView3": (context) => ListView3(),
        "/ListView4": (context) => ListView4(),
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
      // 设置页面内容
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("ListView"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/ListView1");
              },
            ),
            FlatButton(
              child: Text("ListView.builder"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/ListView2");
              },
            ),
            FlatButton(
              child: Text("ListView.separated"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/ListView3");
              },
            ),
            FlatButton(
              child: Text("ListView.custom"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/ListView4");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("普通列表"),
      ),
      body: ListView(
        // scrollDirection: Axis.horizontal, // 横向滚动, Left and right.
        scrollDirection: Axis.vertical, // 上下滚动，Up and down.
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            width: 300,
            height: 1000,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            width: 300,
            height: 1000,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            width: 300,
            height: 1000,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}

class ListView2 extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("循环列表"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 1000,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
      ),
    );
  }
}

class ListView3 extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("间隔线循环列表"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(), // 间隔线
      ),
    );
  }
}

class ListView4 extends StatefulWidget {
  @override
  _ListView4State createState() => _ListView4State();
}

class _ListView4State extends State<ListView4> {
  List<String> items = <String>['1', '2', '3', '4', '5'];

  void _reverse() {
    setState(() {
      // 反转
      items = items.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义列表"),
      ),
      body: SafeArea(
        child: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return KeepAlive(
                data: items[index],
                key: ValueKey<String>(items[index]),
              );
            },
            childCount: items.length,
            findChildIndexCallback: (Key key) {
              final ValueKey valueKey = key;
              final String data = valueKey.value;
              return items.indexOf(data);
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () => _reverse(),
              child: Text('Reverse items'),
            ),
          ],
        ),
      ),
    );
  }
}

class KeepAlive extends StatefulWidget {
  const KeepAlive({Key key, this.data}) : super(key: key);

  final String data;

  @override
  _KeepAliveState createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 50,
      color: Colors.red,
      child: Center(
        child: Text(widget.data),
      ),
    );
  }
}
