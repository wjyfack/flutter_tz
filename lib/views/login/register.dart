/*
 * @Author: wjyfack
 * @Date: 2020-11-27 14:41:08
 * @Description: 注册页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/utils/config.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final mainColor = Config.mainColor;

  // 整体布局
  Widget _center() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(118)),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(44)),
      child: Column(
        children: [
          _textPhoneFied(),
          SizedBox(width: ScreenUtil().setWidth(20), height: ScreenUtil().setHeight(20)),
          _textFied('请输入验证码', Icons.message_outlined),
          SizedBox(width: ScreenUtil().setWidth(20), height: ScreenUtil().setHeight(20)),
          _textFied('请输入验证码', Icons.lock, obscureText: true),
          SizedBox(width: ScreenUtil().setWidth(133), height: ScreenUtil().setHeight(133)),
          _button()
        ]
      ),
    );
  }
  // 手机号输入框
  Widget _textPhoneFied() {
    return Container(
      height: ScreenUtil().setHeight(40),
      width: ScreenUtil().setWidth(272),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(25)),
        boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(0, 7), blurRadius: 20, spreadRadius: -8)
        ]
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '请输入手机号',
                prefixIcon: Icon(Icons.person, color: Config.bodyColor,),
                border: InputBorder.none,
              ),
            ),
          ),
          
          InkWell(
              onTap: () {},
              child: Container(
                height: ScreenUtil().setHeight(28),
                width: ScreenUtil().setWidth(70),
                margin: EdgeInsets.fromLTRB(8, 6, 8, 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: mainColor, width: 1),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Text('30s', style: TextStyle(color: mainColor, fontSize: ScreenUtil().setSp(10)),),
              )
            )
        ],
      )
    );
  }

  // 输入框
  Widget _textFied(String hintText, IconData iconData,{ bool obscureText = false}) {
    return Container(
      height: ScreenUtil().setHeight(40),
      width: ScreenUtil().setWidth(272),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(25)),
        boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(0, 7), blurRadius: 20, spreadRadius: -8)
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(iconData, color: Config.bodyColor,),
              border: InputBorder.none,
            ),
            obscureText: obscureText,
          ),
        ],
      ) 
    );
  }

  // 点击按钮
  Widget _button() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(272),
        height: ScreenUtil().setHeight(40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: mainColor,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(25))
        ),
        child: Text('提交注册', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(15)),),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(360),
        height: ScreenUtil().setHeight(640),
        color: mainColor,
        child: _center(),
      ),
    );
  }
}