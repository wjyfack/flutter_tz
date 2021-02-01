/*
 * @Author: wjyfack
 * @Date: 2020-12-01 13:58:22
 * @Description: 整改
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/utils/config.dart';
import 'package:flutterj/utils/route_util.dart';
import 'package:flutterj/views/rectify/rectifyDetail.dart';

class RectifyPage extends StatefulWidget {
  RectifyPage({Key key}) : super(key: key);

  @override
  _RectifyPageState createState() => _RectifyPageState();
}

class _RectifyPageState extends State<RectifyPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() { 
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  Widget _tabs() {
    return Column(
      children: [
        TabBar(
          controller:  _tabController,
          tabs: [
            Container(
              padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(13)),
              child: Text('待整改', style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Config.bodyColor),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(13)),
              child: Text('已提交', style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Config.bodyColor),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(13)),
              child: Text('全部', style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Config.bodyColor),),
            ),
          ]
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.separated(
                itemBuilder: (context, index) {
                  return _item();
                },
                separatorBuilder: (context, index) {
                  return Container(height: 3, color: Config.moduleColor,);
                },
                itemCount: 5
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return _item();
                },
                separatorBuilder: (context, index) {
                  return Container(height: 3, color: Config.moduleColor,);
                },
                itemCount: 5
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return _item();
                },
                separatorBuilder: (context, index) {
                  return Container(height: 3, color: Config.moduleColor,);
                },
                itemCount: 5
              ),
            ]
          )
           
        )
      ],
    );
  }
  Widget _item() {
    return InkWell(
      onTap: () {
        pushNewPage(context, RectifyDetailPage());
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(10), ScreenUtil().setWidth(20), ScreenUtil().setHeight(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('整改截止日期 2018-06-23', style: TextStyle(fontSize: ScreenUtil().setSp(14),color:Config.minorTextColor)),
                  _status()
                ]
              ),
            ),
            Divider(height: 1, color: Config.dividerColor),
            Container(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(8), ScreenUtil().setWidth(20), ScreenUtil().setHeight(24)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('指令书 [912100]第(3299)号', style: TextStyle(fontSize: ScreenUtil().setSp(16),color:Config.textColor)),
                  Text('设备描述内容/n', style: TextStyle(fontSize: ScreenUtil().setSp(14),color:Config.minorTextColor))
                ]
              ),
            )
          ]
        ),
      )
    );
  }
  Widget _status() {
    return Row(
      children: [
        Image.asset('images/z_cuo.png', width: 18, height: 18,),
        Text('不通过,重新提交', style: TextStyle(fontSize: ScreenUtil().setSp(13), color: Config.textColor),)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Center( child: Text('设备整改反馈')), backgroundColor: Colors.white,),
      body: _tabs(),
    );
  }
}