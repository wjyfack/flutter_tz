/*
 * @Author: wjyfack
 * @Date: 2020-12-04 11:14:34
 * @Description: 请求返回实体
 */

class DataRes {
	String result;
	dynamic data;
	String code;

	DataRes({this.result, this.data, this.code});

	DataRes.fromJson(Map<String, dynamic> json) {
		result = json['result'];
		data = json['data'];
		code = json['code'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> datas = new Map<String, dynamic>();
		datas['result'] = this.result;
    datas['data'] = this.data;
		datas['code'] = this.code;
		return datas;
	}
}