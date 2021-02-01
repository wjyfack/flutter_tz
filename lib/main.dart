/*
 * @Author: wjyfack
 * @Date: 2020-11-25 14:10:58
 * @Description: 设置适配
 */
import 'package:flutter/material.dart';
import 'package:flutterj/store/index.dart';
import 'package:flutterj/views/splash_screen.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    MultiProvider( // 引入provider
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderModel())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: '特种设备企业端',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenPage(),
    );
  }
}
