import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'loading/ball/ball.dart';
import 'loading/ball/ball_3_opacity.dart';
import 'loading/ball/ball_style.dart';
import 'loading/circle/circle_square.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //这里就是关键的代码，定义一个key
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff8faf8),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                // width: 70.w,
                // height: 15,
                child: Ball3OpacityLoading(
                  key: ball3OpacityLoadingStateChildKey,
                  ballStyle: BallStyle(size: 10, color: Colors.black),
                ),
              ),
            ),
            InkWell(
              child: Text("stop"),
              onTap: () {
                ball3OpacityLoadingStateChildKey.currentState.dispose();
              },
            ),
            Row(
              children: List.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Ball(
                    style: BallStyle(size: 10, color: Colors.black),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
