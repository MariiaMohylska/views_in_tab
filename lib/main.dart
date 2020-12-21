import 'package:flutter/material.dart';
import 'package:views_in_tab/videoplayer_widget.dart';

import 'mapview_widget.dart';
import 'webview_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // routes: ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//WebViewWidget
class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    WebViewWidget(),
    MapViewWidget(),
    VideoPlayerWidget()
  ];

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('My Flutter App'),
    ),
    body: _children[_currentIndex], //
    bottomNavigationBar: BottomNavigationBar( onTap: onTabTapped,
    currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.wb_cloudy_outlined),
          label: 'WebView'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
              label: 'MapView'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
          label: 'VideoPlayer'
        )
      ],
    ),
    );
  }
}


class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
