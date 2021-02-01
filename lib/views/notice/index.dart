/*
 * @Author: wjyfack
 * @Date: 2020-12-01 10:12:48
 * @Description: 消息
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/utils/config.dart';
import 'package:flutterj/utils/route_util.dart';
import 'package:flutterj/views/notice/detail.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  Widget _item() {
    return InkWell(
      onTap: () {
        // 跳转到详情页
        pushNewPage(context, NoticeDetailPage());
      },
      child: Container(
        color: Colors.white,
        height: ScreenUtil().setHeight(64),
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(25), ScreenUtil().setHeight(12), ScreenUtil().setWidth(25), ScreenUtil().setHeight(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _radio(),
                      SizedBox(width: ScreenUtil().setWidth(7), height: ScreenUtil().setHeight(7),),
                      Text('您有设备即将年检', style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Config.textColor),)
                    ],
                  )
                ),
                Text('今天 12:30', 
                  style: TextStyle( fontSize: ScreenUtil().setSp(12), color: Config.minorTextColor, )
                )
              ],
            ),
            SizedBox(width: ScreenUtil().setWidth(7), height: ScreenUtil().setHeight(7),),
            Container(
              child: Text('设备登记号为梯粤EMC234将于2018年4月进行年检…',overflow: TextOverflow.ellipsis, style: TextStyle(
                fontSize: ScreenUtil().setSp(12), color: Config.bodyColor, )
              ),
            )
          ]
        ),
      ),
    );
  }
  Widget _radio() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(6)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新消息'), backgroundColor: Colors.white,),
      backgroundColor: Config.moduleColor,
      body: Container(
        child: ListView.separated(
          itemCount: 4,
          itemBuilder: (context, index) {
            return _item();
          },
          separatorBuilder: (context, index) {
            return Divider(height: 1, color: Config.dividerColor);
          },
        ),
      ),
    );
  }
}