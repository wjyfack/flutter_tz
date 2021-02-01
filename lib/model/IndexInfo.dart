/*
 * @Author: wjyfack
 * @Date: 2020-12-07 14:51:02
 * @Description: 首页请求列
 */

class IndexInfo {
  String equieNum = '0';
  String failNum = '0';
  List<Divice> list = [];

  IndexInfo({this.equieNum, this.failNum, this.list});

  IndexInfo.fromJson(Map<String, dynamic> json) {
    equieNum = json['equieNum'];
    failNum = json['failNum'];
    if (json['list'] != null) {
      list = new List<Divice>();
      json['list'].forEach((v) {
        list.add(new Divice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['equieNum'] = this.equieNum;
    data['failNum'] = this.failNum;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Divice {
  String id;
  String deviceName;
  String complete;
  String nextAnualDate;
  String deviceNo;
  String sortName;

  Divice(
      {this.id,
      this.deviceName,
      this.complete,
      this.nextAnualDate,
      this.deviceNo,
      this.sortName});

  Divice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceName = json['deviceName'];
    complete = json['complete'];
    nextAnualDate = json['nextAnualDate'];
    deviceNo = json['deviceNo'];
    sortName = json['sortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deviceName'] = this.deviceName;
    data['complete'] = this.complete;
    data['nextAnualDate'] = this.nextAnualDate;
    data['deviceNo'] = this.deviceNo;
    data['sortName'] = this.sortName;
    return data;
  }
}
