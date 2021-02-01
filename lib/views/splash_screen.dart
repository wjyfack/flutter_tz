/*
 * @Author: wjyfack
 * @Date: 2020-11-27 09:33:27
 * @Description: 启动页
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/utils/route_util.dart';
import 'package:flutterj/views/login/login.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override

  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    checkFirstSeen(context);
  }
  Future checkFirstSeen(context) async {
    Timer(Duration(milliseconds: 3000), () {
      print("----------splash--------");
      pushAndRemovePage(context, LoginPage());
    });
  }
  @override
  Widget build(BuildContext context) {
    // 设置适配尺寸 (填入设计稿中设备的屏幕尺寸)按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context, designSize: Size(360, 640), allowFontScaling: false);
    return Scaffold(
      body: Container(
          height: ScreenUtil().setHeight(640),
          width: ScreenUtil().setWidth(360),
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/start.png'),fit: BoxFit.cover),
            ),
            child: Text('')
          ),
        ),
    );
  }

}