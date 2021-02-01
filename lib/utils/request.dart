/*
 * @Author: wjyfack
 * @Date: 2020-12-04 09:37:55
 * @Description: dio 请求库封装
 */
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class HttpManager {
  //  baseUrl
  final String _BASEURL = 'https://www.fastmock.site/mock/14260e6bd4743d0fcb56d3700a2eeef3/equipment';
  final int _CONNECTTIMEOUT = 5000;
  final int _RECEIVETIMEOUT = 3000;

  // 单例模式
  static HttpManager _instance;
  Dio _dio;
  BaseOptions _options;
  // headers
  Map<String, dynamic> optHeader = {
    'accept-language': 'zh-cn',
    'content-type': 'application/json; charset=utf-8',
    };
  // 单例模式，只创建一次实例
  static HttpManager getInstance() {
    if (null == _instance) {
      _instance = HttpManager();
    }
    return _instance;
  }

  // 构造函数
  HttpManager() {
    _options = BaseOptions(
      baseUrl: _BASEURL,
      // 连接时间为5秒
      connectTimeout: _CONNECTTIMEOUT,
      // 响应时间为3秒
      receiveTimeout: _RECEIVETIMEOUT,
      // 设置请求头
      headers: optHeader,
      // 默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      contentType: Headers.formUrlEncodedContentType,
      // 共有三种方式json,bytes(响应字节),stream（响应流）,plain
      responseType: ResponseType.json
    );
    _dio = Dio(_options);
    // 设置cookie
    _dio.interceptors.add(CookieManager(CookieJar()));
    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print('在请求之前的拦截信息');
        return options;
      },
      onResponse: (Response response) {
        print('在响应之前的拦截信息');
        return response;
      },
      onError: (DioError e) {
        print('在错误之前的拦截信息');
        return e;
      }
    ));
  }
  // get请求方法
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.get(
        url,
        queryParameters:  data,
        options: options,
        cancelToken: cancelToken
      );
      print('getHttp response: $response');
    } on DioError catch(e) {
      print('getHttp exception: $e');
      formatError(e);
    }
    return response;
  }
  // post 请求
  post(url, {params, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.post(
        url,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken
      );
      print('postHttp response: $response');
    } on DioError catch(e) {
      print('postHttp exception: $e');
      formatError(e);
    }
    return response;
  }
  // post Form请求
  postForm(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.post(
        url,
        data: data,
        options: options,
        cancelToken: cancelToken
      );
      print('postHttp response: $response');
    } on DioError catch(e) {
      print('postForm exception: $e');
      formatError(e);
    }
    return response;
  }
  // 下载文件
  downLoadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await _dio.download(urlPath, savePath, onReceiveProgress: (int count, int total) {
        print('$count $total');
      });
      
      print('downLoadFile response: $response');
    } on DioError catch (e) {
      print('downLoadFile exception: $e');
      formatError(e);
    }
  }

  // 取消请求
  cancleRequest(CancelToken token) {
    token.cancel('cancelled');
  }

  void formatError(DioError e) {
    switch (e.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        print('连接超时');
        break;
      case DioErrorType.SEND_TIMEOUT:
        print('请求超时');
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        print('响应超时');
        break;
      case DioErrorType.RESPONSE:
        print('出现异常');
        break;
      case DioErrorType.CANCEL:
        print('请求取消');
        break;
      default:
        print('未知错误');
    }
  }
}