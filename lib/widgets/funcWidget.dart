/*
 * @Author: wjyfack
 * @Date: 2020-12-03 09:30:37
 * @Description: 函数组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FuncWidget {
  // 标题
  static Widget widgetTile(String name) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(11), 0, ScreenUtil().setHeight(11)),
        child: Row(
          children: [
            Container(height: ScreenUtil().setHeight(13), width: ScreenUtil().setWidth(2), color: Color.fromRGBO(253, 201, 21, 1),),
            SizedBox(height: ScreenUtil().setHeight(13), width: ScreenUtil().setWidth(13)),
            Text(name, style: TextStyle(color: Color.fromRGBO(28, 38, 39, 1), fontSize: ScreenUtil().setSp(14)),)
          ]
        ),
      );
  }
  // 内容显示
  static Widget infoItem(String name, String value, {bool image = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // alignment: Alignment.topLeft,
            width: ScreenUtil().setWidth(121),
            child: Text(name, style: TextStyle(color: Color.fromRGBO(28, 38, 39, 1), fontSize: ScreenUtil().setSp(14)),),
          ),
          Expanded(
            child: image ? Row(
              children: [Image.network(value, width: ScreenUtil().setWidth(64), height: ScreenUtil().setHeight(85))]
            )
              : Text(value, maxLines: 3, style: TextStyle(color: Color.fromRGBO(117, 121, 128, 1), fontSize: ScreenUtil().setSp(14)),),
          )
        ]
      ),
    );
  }
}

