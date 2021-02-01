/*
 * @Author: wjyfack
 * @Date: 2020-12-07 10:01:23
 * @Description: 状态管理
 */

import 'package:flutter/material.dart';
import 'package:flutterj/model/userInfo.dart';

class ProviderModel extends ChangeNotifier {
  UserInfo userInfo;
  void changeUserInfo(UserInfo info) {
    // 数据变动通知监听者刷新UI
    // print(userInfo.toString());
    userInfo = info;
    notifyListeners();
  }

}
