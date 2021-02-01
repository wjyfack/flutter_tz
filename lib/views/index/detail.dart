/*
 * @Author: wjyfack
 * @Date: 2020-11-30 16:56:42
 * @Description: 设备详情
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/utils/config.dart';

class DeviceDetailPage extends StatefulWidget {
  @override
  _DeviceDetailPageState createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {
  
  Widget _title(String name) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(10)),
      padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), 0, 0, 0),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Config.mainColor, width: 2))
      ),
      child: Text(name, style: TextStyle(color: Config.textColor, fontSize: ScreenUtil().setSp(16)),),
    );
  }
  // 内容
  Widget _item(String name, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(121),
            child: Text(name, style: TextStyle(color: Config.textColor, fontSize: ScreenUtil().setSp(14)),),
          ),
          Expanded(
            child: Text(value, maxLines: 3, style: TextStyle(color: Config.bodyColor, fontSize: ScreenUtil().setSp(14)),),
          )
        ]
      ),
    );
  }
  // 基本信息
  Widget _base() {
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(18)),
      color: Colors.white,
      child: Column(
        children: [
          _title('基本信息'),
          Divider(height: 1, color: Config.dividerColor),
          Container(height: 5,),
          _item('使用登记证', '梯11粤EM0866'),
          _item('下次年检时间', '2018-04'),
          _item('设备名称或型号', 'NPM/H-Ⅱ'),
          _item('设备类别', '载货电梯'),
          _item('单位内编号', '1＃'),
          _item('产品编号', 'T1112-013F'),
          _item('设备代码', '32104406002012050030'),
          _item('设备位置', '佛山市南海区大沥镇盐步穗盐 路牛栏岗工业区'),
          _item('设备状态', '在用'),
          _item('制造时间', '2002-04'),
          _item('制造单位', '广东台日电梯有限公司'),
          _item('安装单位', '广东台日电梯有限公司'),
        ]
      ),
    );
  }
  // 参数信息 
  Widget _pararms() {
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(18)),
      color: Colors.white,
      child: Column(
        children: [
          _title('设备参数信息'),
          Divider(height: 1, color: Config.dividerColor),
          Container(height: 5,),
          _item('额定载荷 ', '630'),
          _item('额定速度', '1.00'),
          _item('层站层', '9'),
          _item('提升高度', '24.8'),
        ]
      ),
    ); 
  }
  // 检验信息
  Widget _test() {
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(18)),
      color: Colors.white,
      child: Column(
        children: [
          _title('定期检验信息'),
          Divider(height: 1, color: Config.dividerColor),
          Container(height: 5,),
          _item('上次检验结论 ', '合格'),
          _item('上次检验日期', '2017-08-02'),
          _item('下次检验日期', '2018-08-31'),
        ]
      ),
    ); 
  }
  /// 间隙
  Widget _clearance() {
    return Container(
      height: ScreenUtil().setHeight(14),
      color: Config.moduleColor,
    );
  }
  // 有误
  Widget _mistake() {
    return InkWell(
      onTap: () {print('_mistake');},
      child: Container(
        margin: EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        child: Text('是否信息有误？', style: TextStyle(fontSize: ScreenUtil().setSp(14), color: Config.auxiliaryColor),),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设备信息详情'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Config.moduleColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _base(),
            _clearance(),
            _pararms(),
            _clearance(),
            _test(),
            _mistake(),
            Container(height: ScreenUtil().setHeight(150),)
          ],
        ),
      )
      
    );
  }
}