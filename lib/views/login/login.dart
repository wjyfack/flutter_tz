/*
 * @Author: wjyfack
 * @Date: 2020-11-27 10:27:25
 * @Description: 登录页面
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/model/data.dart';
import 'package:flutterj/model/userInfo.dart';
import 'package:flutterj/store/index.dart';
import 'package:flutterj/utils/api.dart';
import 'package:flutterj/utils/config.dart';
import 'package:flutterj/utils/request.dart';
import 'package:flutterj/utils/route_util.dart';
import 'package:flutterj/views/login/register.dart';
import 'package:flutterj/views/home.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;
  // TextEditingController _unameController = TextEditingController();
  // 跳转到注册
  void _toRegisterPage(context) {
    pushNewPage(context, RegisterPage());
  }
  void _toHomePage(context)  async {
    
    if (null == username || username == '') {
      Toast.show('请输入用户名', context, gravity: Toast.CENTER);
      return null;
    }
    if (null == password || password == '') {
      Toast.show('请输入密码', context, gravity: Toast.CENTER);
      return null;
    }
    print('$username, $password');
    Map<String, dynamic> data = {
      'username': username,
      'password': password
    };
    // FormData formData = FormData.fromMap(data);
    var response = await HttpManager.getInstance().get(urlLink[Api.Login], data: data, cancelToken: CancelToken());
    // print(response);
    var res = json.decode(response.toString());
    // print(res['data']);
    DataRes dataRes = DataRes.fromJson(res);
    // print(dataRes.data);
    if (dataRes.code == '0000' ) { // 操作成功
      UserInfo userInfo = UserInfo.fromJson(dataRes.data);
      ProviderModel providerModel = Provider.of<ProviderModel>(context, listen: false);
      providerModel.changeUserInfo(userInfo);
      pushAndRemovePage(context, HomePage());
    } else {
      Toast.show('用户名或密码错误', context, gravity: Toast.CENTER);
    }
  }

  // 表单
  Widget _form() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(240),),
      child: Column(
        children: [
          _textFied('用户名', Icons.person, (value) { setState(() { username = value; });}),
          SizedBox(width: ScreenUtil().setWidth(25), height: ScreenUtil().setHeight(25)),
          _textFied('密码', Icons.lock,(value) { setState(() { password = value; });}, obscureText: true,),
          SizedBox(width: ScreenUtil().setWidth(74), height: ScreenUtil().setHeight(74)),
          _btnG()
        ],
      ),
    );
  }
  // 输入框
  Widget _textFied(String hintText, IconData iconData, Function fn, { bool obscureText = false}) {
    return Container(
      height: ScreenUtil().setHeight(50),
      width: ScreenUtil().setWidth(282),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setHeight(25)),
        boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(0, 7), blurRadius: 20, spreadRadius: -8)
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: fn,
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
  Widget _btnG() { // 按钮租
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _button(Colors.white, Config.mainColor, '注册', () { _toRegisterPage(context); }),
          _button(Config.mainColor, Colors.white, '登陆', () {_toHomePage(context);}),
        ],
      ),
    );
  }
  // 按钮
  Widget _button(Color color, Color bg, String text, Function fn) {
    return GestureDetector(
      onTap: fn,
      child: Container(
        height: ScreenUtil().setHeight(40),
        width: ScreenUtil().setWidth(121),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(23),
          boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(0, 7), blurRadius: 20, spreadRadius: -8),
          ]
        ),
        child: Text(text, style: TextStyle(color: color, fontSize: ScreenUtil().setSp(18)),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenUtil().setHeight(640),
        width: ScreenUtil().setWidth(360),
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/backgroud.png'), fit: BoxFit.cover)
          ),
          child: Stack(
            children: [
              _form(),
              Positioned(
                bottom: 14,
                child: Container(
                  width: ScreenUtil().setWidth(360),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('忘记密码？', style: TextStyle(color: Color.fromRGBO(245, 166, 35, 1), fontSize: ScreenUtil().setSp(13))),
                    ],
                  )
                ),
                
              )
            ],
          ),
        ),
      ),
    );
     
  }
}