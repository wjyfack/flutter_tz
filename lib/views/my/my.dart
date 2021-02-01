/*
 * @Author: wjyfack
 * @Date: 2020-12-01 17:32:43
 * @Description: 我的
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/store/index.dart';
import 'package:flutterj/utils/route_util.dart';
import 'package:flutterj/views/login/login.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // 头像
  Widget _header() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: ScreenUtil().setHeight(128),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/my_bg.png'), fit: BoxFit.fill)
              ),
              child: Text('')
            ),
            Container(
              height: ScreenUtil().setHeight(68),
            ),
            Divider(height: 1, color: Color.fromRGBO(238, 239, 244, 1))
          ]
        ),
        _avatar()
      ],
    );
  }
  Widget _avatar() {
    // ProviderModel providerModel = Provider.of<ProviderModel>(context);
    // print(providerModel.userInfo.toString());
    return Positioned(
      left: 0,
      right: 0,
      child: Column(
        children: [
          SizedBox(width: ScreenUtil().setWidth(53), height: ScreenUtil().setHeight(53)),
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/my_person.png')
          ),
          Text(Provider.of<ProviderModel>(context).userInfo?.name ?? '', style: TextStyle(color: Color.fromRGBO(28, 38, 39, 1), fontSize: ScreenUtil().setSp(18)),)
          // Consumer<ProviderModel>(builder: (context, model, child) {
          //   print(model.name);
          //   return Text('科技有限公司', style: TextStyle(color: Color.fromRGBO(28, 38, 39, 1), fontSize: ScreenUtil().setSp(18)),);
          // })
        ],
      ),
    );
  }
  Widget _list() {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            leading: Image.asset('images/my_rengzheng.png', width: ScreenUtil().setWidth(20), height: ScreenUtil().setHeight(20)),
            title: Text('设备认证', style: TextStyle(fontSize: ScreenUtil().setSp(14),color: Color.fromRGBO(28, 38, 39, 1))),
            onTap: () { print('设备认证'); },
          ),
          ListTile(
            leading: Image.asset('images/my_qiye.png', width: ScreenUtil().setWidth(20), height: ScreenUtil().setHeight(20)),
            title: Text('企业信息', style: TextStyle(fontSize: ScreenUtil().setSp(14),color: Color.fromRGBO(28, 38, 39, 1))),
          ),
          ListTile(
            leading: Image.asset('images/my_info.png', width: ScreenUtil().setWidth(20), height: ScreenUtil().setHeight(20)),
            title: Text('联系人信息', style: TextStyle(fontSize: ScreenUtil().setSp(14),color: Color.fromRGBO(28, 38, 39, 1))),
          ),
          _divider(),
          ListTile(
            leading: Image.asset('images/phone.png', width: ScreenUtil().setWidth(20), height: ScreenUtil().setHeight(20)),
            title: Text('绑定手机', style: TextStyle(fontSize: ScreenUtil().setSp(14),color: Color.fromRGBO(28, 38, 39, 1))),
          ),
          ListTile(
            leading: Image.asset('images/my_xiugai.png', width: ScreenUtil().setWidth(20), height: ScreenUtil().setHeight(20)),
            title: Text('修改密码', style: TextStyle(fontSize: ScreenUtil().setSp(14),color: Color.fromRGBO(28, 38, 39, 1))),
          ),
          ListTile(
            leading: Image.asset('images/my_about.png', width: ScreenUtil().setWidth(20), height: ScreenUtil().setHeight(20)),
            title: Text('关于软件', style: TextStyle(fontSize: ScreenUtil().setSp(14),color: Color.fromRGBO(28, 38, 39, 1))),
          ),
          _divider(),
          ListTile(
            leading: Image.asset('images/my_tuichu.png', width: ScreenUtil().setWidth(20), height: ScreenUtil().setHeight(20)),
            title: Text('退出登陆', style: TextStyle(fontSize: ScreenUtil().setSp(14),color: Color.fromRGBO(28, 38, 39, 1))),
            onTap: () {
              pushAndRemovePage(context, LoginPage());
            },
          ),
          _divider(),
        ]
      ).toList(),
    );
  }
  Widget _divider() {
    return Container(
      height: ScreenUtil().setHeight(10),
      color: Color.fromRGBO(238, 239, 244, 1)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _header(),
          Expanded(
            child: _list()
          )
        ]
      ),
    );
  }
}
