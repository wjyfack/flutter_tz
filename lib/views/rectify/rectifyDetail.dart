/*
 * @Author: wjyfack
 * @Date: 2020-12-03 09:36:31
 * @Description: 提交整改
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterj/utils/config.dart';

import 'package:flutterj/widgets/funcWidget.dart';
import 'package:image_picker/image_picker.dart';

class RectifyDetailPage extends StatefulWidget {
  RectifyDetailPage({Key key}) : super(key: key);

  @override
  _RectifyDetailPageState createState() => _RectifyDetailPageState();
}

class _RectifyDetailPageState extends State<RectifyDetailPage> {
  bool _actity = true;
  List<File> images = [];
  final picker = ImagePicker();
  @override
  void initState() { 
    super.initState();
    
  }
  // 任务图片选择
  void _pickImage() async {
    final prickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (prickedFile != null) {
        images.add(File(prickedFile.path));
      } else {
        print('no image selected.');
      }
    });
  }

  // 任务详情
  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          FuncWidget.widgetTile('指令书'),
          Divider(height: 1, color: Config.dividerColor,),
          Container(height: ScreenUtil().setHeight(9), color: Colors.white),
          FuncWidget.infoItem('指令书编号', '[12018]第(3312)号'),
          FuncWidget.infoItem('指令书流水号', '000000'),
          FuncWidget.infoItem('设备描述', '容1LE粤EMB359'),
          FuncWidget.infoItem('隐患描述', '未按照规定办理使用登记； 未配备具有相应资格的特种设备作业人员。'),
          FuncWidget.infoItem('违反条例', '《中华人民共和国特种设备安全法》第三十三条；第十四条'),
          FuncWidget.infoItem('处罚依据条例', '《中华人民共和国特种设备安全法》第六十二条；第八十三条；第八十六条。 '),
          FuncWidget.infoItem('整改措施', '1.限期内办理使用登记相关的手续，并且同类特种设备在投入使用前或者投入使用后三十日内向特种设备安全监督管理的部门办理使用登记； 2.特种设备作业人员应当按照国家有关规定取得相应资格，方可从事相关工作。'),
          FuncWidget.infoItem('整改截止日期', '2018-06-23'),
          FuncWidget.infoItem('指令书日期', '2018-05-24'),
          FuncWidget.infoItem('指令书图片', 'http://placehold.it/100x100', image: true),
          Container(height: ScreenUtil().setHeight(18), color: Colors.white),
          Container(height: ScreenUtil().setHeight(14), color: Config.moduleColor),
          FuncWidget.widgetTile('使用单位'),
          Divider(height: 1, color: Config.dividerColor,),
          Container(height: ScreenUtil().setHeight(9), color: Colors.white),
          FuncWidget.infoItem('使用单位名称', '南海区太平卓达宝染整厂'),
          FuncWidget.infoItem('使用单位地址', '南海区西樵太平'),
          Container(height: ScreenUtil().setHeight(18), color: Colors.white),
          Container(height: ScreenUtil().setHeight(14), color: Config.moduleColor),
          FuncWidget.widgetTile('审核结果'),
          Divider(height: 1, color: Config.dividerColor,),
          Container(height: ScreenUtil().setHeight(9), color: Colors.white),
          FuncWidget.infoItem('任务状态', '未提交/待审核/未通过/已通过'),
          FuncWidget.infoItem('审核说明', '未通过的原因/否则为空'),
          Container(height: ScreenUtil().setHeight(18), color: Colors.white),
          Container(height: ScreenUtil().setHeight(140), color: Config.moduleColor),
        ]
      )
    );
  }
  // 标题
  Widget _appBar() {
    return Container(
        width: ScreenUtil().setWidth(152),
        height: ScreenUtil().setHeight(26),
        decoration: BoxDecoration(
          border: Border.all(color: Config.mainColor, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _actity = true;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _actity ? Config.mainColor : Config.bgColor,
                  ),
                  child: Text(
                    '任务详情',
                    style: TextStyle(
                      color: _actity ? Config.textColor : Config.minorTextColor,
                      fontSize: ScreenUtil().setSp(14)
                    ),
                  ),
                )
              )
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _actity = false;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: !_actity ? Config.mainColor : Config.bgColor,
                  ),
                  child: Text(
                    '提交整改',
                    style: TextStyle(
                      color: !_actity ? Config.textColor : Config.minorTextColor,
                      fontSize: ScreenUtil().setSp(14)
                    ),
                  ),
                )
              )
            )
          ]
        ),
    );
  }
  
  // 提交整改
  Widget _rectify() {
    return  Column(
      children: [
        Expanded(
          child: Container(
            color: Config.dividerColor,
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(64)),
              itemBuilder: (context, index) => _task(),
              separatorBuilder: (context, index) {
                return Container(
                  height: ScreenUtil().setHeight(14),
                  color: Config.dividerColor,
                );
              },
              itemCount: 1
            ),
          )
        ),
        _button()
      ],
    );
  }
  // 操作
  Widget _button() {
    return Container(
      height: ScreenUtil().setHeight(50),
      width: ScreenUtil().setWidth(360),
      color: Config.bgColor,
      child: Row(
        children: [
          _button_back(),
          _button_rectify()
        ]
      ),
    );
  }
  // 上一步
  Widget _button_back() {
    return Expanded(
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            '上一步',
            style: TextStyle(fontSize: ScreenUtil().setSp(16), color: Config.textColor),
          ),
        )
      )
    );
  }
  // 提交整改
  Widget _button_rectify() {
    return Expanded(
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          color: Config.mainColor,
          child: Text(
            '提交整改反馈',
            style: TextStyle(fontSize: ScreenUtil().setSp(16), color: Config.textColor),
          ),
        )
      )
    );
  }
  // 任务
  Widget _task() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          FuncWidget.widgetTile('任务1'),
          Divider(height: 1, color: Config.dividerColor,),
          FuncWidget.infoItem('任务编号', 'CK17110800000549 '),
          FuncWidget.infoItem('任务要求', '过期设备请现场核查'),
          FuncWidget.infoItem('设备编号', '容1LE粤EMB359'),
          FuncWidget.infoItem('单位内编号', 'L1'),
          _listImages(),
          _inputText()
        ]
      ),
    );
  }
  // 整改图片
  Widget _listImages() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('整改图片', style: TextStyle(color: Config.textColor, fontSize: ScreenUtil().setSp(14)),),
          // CustomScrollView(
          //   slivers: [
          //     SliverFixedExtentList(
          //       itemExtent: 10,
          //       delegate: SliverChildBuilderDelegate((context, index) {
          //           return _images(images[index], index);
          //         }, childCount: images.length
          //       ),
          //     ),
          //     SliverToBoxAdapter(
          //       child: InkWell(
          //       onTap: _pickImage,
          //         child:Container(
          //           height: ScreenUtil().setHeight(80),
          //           width: ScreenUtil().setWidth(80),
          //           color: Config.moduleColor,
          //           child: Align(
          //             alignment: Alignment.center,
          //             child: Image.asset('images/add.png'),
          //           ),
          //         )
          //       )
          //     )
          //   ],
          // ),
          Row(
            children: _pickerImages(),
          )
        ],
      ),
    );
  }
  // 图片列表
  List<Widget> _pickerImages() {
    List<Widget> list = [];
    for (var i =0 ; i < images.length; i++) {
      list.add(_images(images[i], i));
    }
    list.add(InkWell(
      onTap: _pickImage,
      child:Container(
        height: ScreenUtil().setHeight(80),
        width: ScreenUtil().setWidth(80),
        color: Config.moduleColor,
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('images/add.png'),
        ),
      )
    ));
    return list;
  }
  // 选择图片
  Widget _images(File file, int index) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(80),
      color: Config.moduleColor,
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
      child: Stack(
        children: [
          Image.file(
            file,
            width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(80),
          )
        ]
      )
    );
  }
  // 整改备注
  Widget _inputText() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
      child:Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(121),
            child: Text('整改备注', style: TextStyle(color: Config.textColor, fontSize: ScreenUtil().setSp(14)),),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: ScreenUtil().setSp(14)),
              decoration: InputDecoration(
                hintText: '已经根据要求整改',
                border: InputBorder.none
              )
            )
          )
        ],
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: _appBar(), centerTitle: true, backgroundColor: Colors.white,),
       backgroundColor: Colors.white,
       body: _actity ? _body() : _rectify(),
    );
  }
}
