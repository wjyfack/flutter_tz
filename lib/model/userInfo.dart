/*
 * @Author: wjyfack
 * @Date: 2020-12-07 09:52:27
 * @Description: 用户信息
 */

class UserInfo {
  String userId;
  String name;
  String token;

  UserInfo({this.userId, this.name, this.token});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['token'] = this.token;
    return data;
  }
}
