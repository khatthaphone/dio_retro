import 'package:alice/alice.dart';
import 'package:dio_retro/api/app_api.dart';
import 'package:dio_retro/dao/post_dao.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.setup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      navigatorKey: GetIt.instance.get<Alice>().getNavigatorKey(),
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
  Logger _logger = Logger();
  List<PostDao> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.wifi),
              onPressed: () {
                GetIt.instance.get<Alice>().showInspector();
              }),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                  onPressed: () async {
                    final api = GetIt.instance.get<AppApi>();

                    try {
                      final posts = await api.getPosts();
                      setState(() {
                        _posts = posts;
                      });

                      _logger.d('Posts: $posts}');
                    } catch (e) {
                      _logger.e(e);
                    }
                  },
                  child: Text('Get Posts')),
            ),
            Text('$_posts'),
          ],
        ),
      ),
    );
  }
}
