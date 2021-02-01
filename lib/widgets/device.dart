/*
 * @Author: wjyfack
 * @Date: 2020-11-30 13:49:23
 * @Description: 设备item
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/utils/route_util.dart';

import 'package:flutterj/views/index/detail.dart';

class DeviceWidget extends StatelessWidget {
  const DeviceWidget({Key key}) : super(key: key);

  Widget _header() {
      final color = Color.fromRGBO(161, 162, 164, 1);
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   width: ScreenUtil().setWidth(45),
          //   height: ScreenUtil().setHeight(45),
          //   decoration: BoxDecoration(
          //     image: DecorationImage(image: Image.network('http://placehold.it/100x100'))
          //   ),
          // ),
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('http://placehold.it/100x100',),
          ),
          SizedBox(width: ScreenUtil().setWidth(16), height: ScreenUtil().setHeight(16),),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('容11粤EM0866(18)', style: TextStyle(fontSize: ScreenUtil().setSp(16), color: Color.fromRGBO(28, 38, 39, 1))),
              Text('资料完善度100%', style: TextStyle(fontSize: ScreenUtil().setSp(11), color: color))
            ]
          )),
          Row(
            children: [
              Text('去完善', style: TextStyle(fontSize: ScreenUtil().setSp(12), color: color)),
              Icon(Icons.arrow_forward_ios, size: 20, color: color,)
            ]
          )
        ],
      );
  }
  // 底部展示的数据
  Widget _show() {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _showItem('下次年检日期', '2020-12', Color.fromRGBO(253, 201, 21, 1)),
        SizedBox(width: 4, height: 4),
        _showItem('单位内编号', '2#', Color.fromRGBO(251, 125, 55, 1)),
        _brand('电梯')
      ],
    );
  }
  // 展示条目
  Widget _showItem(String label, String value, Color color) {
    final textColor = Color.fromRGBO(117, 121, 128, 1); 
    final style = TextStyle(color: textColor, fontSize: ScreenUtil().setSp(12));
    return Row(
      children: [
        Container(
          width: ScreenUtil().setWidth(109),
          padding: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 2, color: color))
          ),
          child: Text(label, style: style,),
        ),
        Text(value, style: style,)
      ],
    );
  }
  // 标签
  Widget _brand(String name) {
    final color = Color.fromRGBO(255, 68, 68, 1);
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
      width: ScreenUtil().setWidth(45),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: color),
      ),
      child: Text(name, style: TextStyle(color: color, fontSize: ScreenUtil().setSp(9)),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewPage(context, DeviceDetailPage());
      },
      child: Container(
        height: ScreenUtil().setHeight(156),
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(19), horizontal: ScreenUtil().setWidth(15)),
        child: Column(
          children: [
            _header(),
            Divider(height: ScreenUtil().setHeight(22), color: Color.fromRGBO(229, 231, 236, 1),),
            Container(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(56)),
              child: _show(),
            )
          ]
        ),
      )
    );
  }
}


