/*
 * @Author: wjyfack
 * @Date: 2020-11-27 16:10:31
 * @Description: 主页
 */
import 'package:flutter/material.dart';
import 'package:flutterj/utils/config.dart';
import 'package:flutterj/views/business/business.dart';
import 'package:flutterj/views/index/index.dart';
import 'package:flutterj/views/my/my.dart';
import 'package:flutterj/views/rectify/rectify.dart';
import 'package:toast/toast.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  DateTime _lastPressedAt; // 上次点击时间

  List<BottomNavigationBarItem> itemsBar = <BottomNavigationBarItem> [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.highlight_off), label: '' ),
    BottomNavigationBarItem(icon: Icon(Icons.payment), label: '' ),
    BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '' ),
  ];
  List<Widget> list = <Widget> [
    IndexPage(),
    RectifyPage(),
    BusinessPage(),
    MyPage(),
  ];

  // 监听返回键，点击两下退出程序
  Future<bool> _onBackPressed() async {
    if (_lastPressedAt == null ||
      DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
      print('点击时间');
      _lastPressedAt = DateTime.now();
      Toast.show("再按一下退出", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: list[_current],
        onWillPop: _onBackPressed
      ),
      // body: list[_current],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 选中图标改为固定
        selectedItemColor: Config.mainColor,
        unselectedItemColor: Config.minorTextColor,
        onTap: (value) {
          setState(() {
            _current = value;
          });
        },
        currentIndex: _current,
        items: itemsBar,
      ),
    );
  }
}
