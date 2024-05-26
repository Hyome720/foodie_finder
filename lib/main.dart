import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  const platform = MethodChannel('flutter/app');
  await platform.invokeMethod('setEnvironmentVariables', {
    'NAVER_CLIENT_ID': dotenv.env['NAVER_CLIENT_ID'],
    'NAVER_CLIENT_SECRET': dotenv.env['NAVER_CLIENT_SECRET'],
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
