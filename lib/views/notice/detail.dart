/*
 * @Author: wjyfack
 * @Date: 2020-12-01 11:13:53
 * @Description: 消息详情
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/utils/config.dart';

class NoticeDetailPage extends StatelessWidget {
  Widget _item() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15), horizontal: ScreenUtil().setWidth(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('您有设备即将年检', style: TextStyle(color: Config.textColor, fontSize: ScreenUtil().setSp(16)),),
              Text('今天 12:30', style: TextStyle(color: Config.minorTextColor, fontSize: ScreenUtil().setSp(12)),),
            ]
          ),
        ),
        Divider(height: 1, color: Config.dividerColor,),
        Container(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(11), horizontal: ScreenUtil().setWidth(25)),
          child: Expanded(
            child: Text(
              ' 设备登记号为梯粤EMC234将于2018年4月进行年检，请配合检查人员进行设备检查工作。',
              maxLines: 100,
              style: TextStyle(color: Config.textColor, fontSize: ScreenUtil().setSp(14))
            )
          ),
        )
      ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(''), backgroundColor: Colors.white,),
      backgroundColor: Config.moduleColor,
      body: Container(
        color: Colors.white,
        child: _item()
      ),
    );
  }
}
