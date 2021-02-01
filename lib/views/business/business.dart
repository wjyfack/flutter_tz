/*
 * @Author: wjyfack
 * @Date: 2020-12-01 15:38:08
 * @Description: 业务
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart';
import 'package:flutterj/utils/config.dart';

import 'package:flutterj/widgets/funcWidget.dart';

class BusinessPage extends StatefulWidget {
  BusinessPage({Key key}) : super(key: key);

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  List<Business> _comList = [
    Business('行政许可业务', 'images/ye_yewu.png'),
    Business('新增设备监视', 'images/ye_jianshi.png'),
    Business('预约检查', 'images/ye_yuyue.png'),
    Business('技术人员招聘', 'images/ye_zhaopin.png'),
    Business('设备新增管理', 'images/ye_xinzeng.png'),
    Business('能源管理', 'images/ye_nengyuan.png'),
    Business('设备维修', 'images/ye_weixiu.png'),
  ];
  List<Business> _perList = [
    Business('特种设备考证', 'images/ye_kaozheng.png'),
    Business('题库练习', 'images/ye_tiku.png'),
    Business('个人求职', 'images/ye_zhili.png'),
    Business('人员培训', 'images/ye_peixun.png'),
    Business('零部件交易', 'images/ye_jiaoyi.png'),
  ];
  // 标题 统一放到 funcWidget中
  // Widget _title(String name) {
  //   return Container(
  //     color: Colors.white,
  //     padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(11), 0, ScreenUtil().setHeight(11)),
  //     child: Row(
  //       children: [
  //         Container(height: ScreenUtil().setHeight(13), width: ScreenUtil().setWidth(2), color: Config.mainColor,),
  //         SizedBox(height: ScreenUtil().setHeight(13), width: ScreenUtil().setWidth(13)),
  //         Text(name, style: TextStyle(color: Config.textColor, fontSize: ScreenUtil().setSp(14)),)
  //       ]
  //     ),
  //   );
  // }
  Widget _item(Business business) {
    return Container(
      // height: ScreenUtil().setHeight(50),
      // width: ScreenUtil().setWidth(50),
      child: Column(
        children: [
          Image.asset(business.url, height: ScreenUtil().setHeight(22), width: ScreenUtil().setWidth(22),),
           SizedBox(height: ScreenUtil().setHeight(5), width: ScreenUtil().setWidth(5)),
          Text(business.name, style: TextStyle(fontSize: ScreenUtil().setSp(10), color: Config.textColor),)
        ],
      ),
    );
  }
  Widget _gridCom() {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(164),
      child: GridView.builder(
        padding: EdgeInsets.all(15.0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemCount: _comList.length,
        itemBuilder: (context, index) {
          return _item(_comList[index]);
        }
      ),
    );
  }
  Widget _gridPerson() {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(164),
      child: GridView.builder(
        padding: EdgeInsets.all(15.0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1
        ),
        itemCount: _perList.length,
        itemBuilder: (context, index) {
          return _item(_perList[index]);
        }
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('业务办理', style: TextStyle(color: Colors.white),),
        actions: [
          Container(
            child: Badge(
              //文本内容Text为空时子组件为null时则返回一个红点，其他值时按实际显示
              badgeContent:Text(""), 
              child: Icon(Icons.notifications_none, color: Colors.white,), //子组件
              badgeColor: Colors.red,  //右上角小红点颜色（默认时为红色）
              showBadge: true,//true时刷新时会在右则摆动一下
              animationDuration:Duration(seconds: 10),//小点点在右侧摆动的时间,这里为10秒
              toAnimate: false, //允许摆动，false时showBadge会失效
            ),
          ),
          
          SizedBox(height: ScreenUtil().setHeight(15), width: ScreenUtil().setWidth(15)),
        ]
      ),
      backgroundColor: Config.moduleColor,
      body: Container(
        child: Column(
          children: [
            FuncWidget.widgetTile('企业业务'),
            _gridCom(),
            Divider(height: 1, color: Config.dividerColor),
            FuncWidget.widgetTile('个人业务'),
            _gridPerson()
          ]
        ),
      ),
    );
  }
}

// 业务
class Business {
  String name;
  String url;
  Business(this.name, this.url);
}