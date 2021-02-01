/*
 * @Author: wjyfack
 * @Date: 2020-11-30 08:55:04
 * @Description: 主页显示
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart';
import 'package:flutterj/model/IndexInfo.dart';
import 'package:flutterj/model/data.dart';
import 'package:flutterj/utils/api.dart';
import 'package:flutterj/utils/config.dart';
import 'package:flutterj/utils/request.dart';
import 'package:flutterj/utils/route_util.dart';
import 'package:flutterj/views/notice/index.dart';

import 'package:flutterj/widgets/device.dart';
import 'package:toast/toast.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  IndexInfo _indexInfo = IndexInfo(
    failNum: '0',
    equieNum: '0',
    list: []
  );
  ScrollController _scrollController = ScrollController();

  @override
  void initState() { 
    super.initState();
    getList();
    _scrollController.addListener(() {
      // 检查是否滚到底部
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        Toast.show('加载中...', context, duration: 0, gravity: Toast.CENTER);
        moreList();
      }
    });
  }
  void moreList() async {
    await Future.delayed( Duration(seconds: 2));
    var response = await HttpManager().get(urlLink[Api.Index],);
    ToastView.dismiss();
    DataRes dataRes = DataRes.fromJson(json.decode(response.toString()));
    IndexInfo indexInfo = IndexInfo.fromJson(dataRes.data);
    _indexInfo.list.addAll(indexInfo.list);
    setState(() {
      _indexInfo = _indexInfo;
    });
  }
  // 获取数据
  void getList() async {
    var response = await HttpManager().get(urlLink[Api.Index],);
    // var res = json.decode(response.toString());
    // print(res);
    DataRes dataRes = DataRes.fromJson(json.decode(response.toString()));
    IndexInfo indexInfo = IndexInfo.fromJson(dataRes.data);
    setState(() {
      _indexInfo = indexInfo;
    });
  }
    
  // 头部
  Widget _header() {
    return Container(
      width: ScreenUtil().setWidth(360),
      height: ScreenUtil().setHeight(160),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromRGBO(255, 155, 0, 1),Color.fromRGBO(253, 233, 21, 1),]
        )
      ),
      child: Column(
        children: [
          _headerSearch(),
          SizedBox(width: ScreenUtil().setWidth(23), height: ScreenUtil().setHeight(23),),
          _header_nums(),
        ],
      ),
    );
  }
  // 搜索
  Widget _headerSearch() {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(31)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(50), 0, ScreenUtil().setWidth(30), 0),
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(14)),
              width: ScreenUtil().setWidth(244),
              height: ScreenUtil().setHeight(26),
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: TextField(
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                  ),
                  decoration: InputDecoration(
                    hintText: '请输入编号搜索',
                    hintStyle: TextStyle(fontSize: ScreenUtil().setSp(12),color: Config.minorTextColor),
                    icon: Icon(Icons.search, size: 24, color: Config.minorTextColor,),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 13)
                  )
                ),
              ),
            )
          ),
          Container(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
            child: InkWell(
              onTap: () {
                // 跳转到消息列表
                pushNewPage(context, NoticePage());
              },
              child: Badge(
                //文本内容Text为空时子组件为null时则返回一个红点，其他值时按实际显示
                badgeContent:Text(""), 
                child: Icon(Icons.notifications_none, color: Colors.white,), //子组件
                badgeColor: Colors.red,  //右上角小红点颜色（默认时为红色）
                showBadge: true,//true时刷新时会在右则摆动一下
                animationDuration:Duration(seconds: 10),//小点点在右侧摆动的时间,这里为10秒
                toAnimate:false, //允许摆动，false时showBadge会失效
              ),
            ),
          ),
          
        ],
      ),
    );
  }
  // 数量
  Widget _header_nums() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _headerNumsDetail('特种设备数量', _indexInfo.equieNum),
        _headerNumsDetail('不合格数量', _indexInfo.failNum),
      ],
    );
  }
  // 数量详情
  Widget _headerNumsDetail(String name, String num) {
    return Column(
      children: [
        // Text(name, style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(11),),
        Text.rich(TextSpan(children: [
          TextSpan(text: name, style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(11),))
        ])),
        Text.rich(
          TextSpan(
            children: [
            TextSpan(text: num.toString(), style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(50),)),
            TextSpan(text: '台', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(14),)),
          ]),
          textAlign: TextAlign.end,
        )
      ],
    );
  }
  // 分类
  Widget _sort() {
    // final colors = Config.bodyColor;
    final styles = TextStyle(color: Config.bodyColor, fontSize: ScreenUtil().setSp(14),);
    return Container(
      height: ScreenUtil().setHeight(32),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: ScreenUtil().setHeight(3), color: Config.moduleColor))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: DropdownButton(
            hint: Text('种类', style: styles,),
              underline: Container(height: 0,),
              items: [
                DropdownMenuItem(child: Text('锅炉', style: styles,),),
                DropdownMenuItem(child: Text('压力容器', style: styles,),),
                DropdownMenuItem(child: Text('电梯', style: styles,),),
                DropdownMenuItem(child: Text('起重机', style: styles,),),
                DropdownMenuItem(child: Text('叉车', style: styles,),),
                DropdownMenuItem(child: Text('压力管道', style: styles,),),
              ],
              onChanged: (value) {}
            ),
          ),
          Container(
            child: DropdownButton(
              hint: Text('排序', style: styles,),
              underline: Container(height: 0,),
              items: [
                DropdownMenuItem(child: Text('默认排序', style: styles,),),
                DropdownMenuItem(child: Text('年检日期由近到远', style: styles,),),
                DropdownMenuItem(child: Text('年检日期由远到近', style: styles,),),
                DropdownMenuItem(child: Text('资料完善度由低到高', style: styles,),),
                DropdownMenuItem(child: Text('资料完善度由高到低', style: styles,),),
              ],
              onChanged: (value) {}
            ),
          )
          
          // Row(
          //   children: [
          //     Text('种类',  style: styles,),
          //     Icon(Icons.arrow_drop_down, color: Config.bodyColor,)
          //   ]
          // ),
          // Row(
          //   children: [
          //     Text('排序', style: styles,),
          //     Icon(Icons.arrow_drop_down, color: Config.bodyColor,)
          //   ]
          // ),
        ],
      ),
    );
  }
  Widget _list() {
   return Expanded(
      child: _indexInfo.list.length == 0 ?
      Center(child: Text('加载中...', style: TextStyle(color: Config.textColor, fontSize: ScreenUtil().setSp(14),),),) :
      ListView.separated(
        controller: _scrollController,
        itemCount: _indexInfo.list.length,
        itemBuilder: (context, index) {
          return DeviceWidget();
        },
        separatorBuilder: (context, index) { // 间距
          return Container(child: Text(''), height: 3, color: Config.moduleColor,);
        },
      )
    );
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          _header(),
          _sort(),
          _list(),
        ]
      ),
    );
  }
}

