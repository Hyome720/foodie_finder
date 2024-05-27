import 'package:flutter/material.dart';
import 'package:foodie_finder/components/map_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foodie Finder'),
      ),
      body: Stack(
        children: [
          MapWidget(),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // 현재 위치로 맛집 검색 로직 추가
              },
              child: Text('현재 위치로 찾기'),
            ),
          ),
        ],
      ),
    );
  }
}
