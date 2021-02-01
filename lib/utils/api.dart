/*
 * @Author: wjyfack
 * @Date: 2020-12-04 09:38:32
 * @Description: 请求api
 */
enum Api {
  Login,
  Index
}

Map<Api, String> urlLink = {
  // 登录
  Api.Login: '/api/login',
  Api.Index: '/api/device/list'
};