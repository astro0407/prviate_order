import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ExampleHorizontal extends StatelessWidget {
  static const List<String> images = [
    "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("ExampleHorizontal"),
        ),
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Image.network(
                  "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                  fit: BoxFit.cover,
                ),
              ],
            );
          },
          autoplay: true,
          itemCount: images.length,
          pagination: SwiperPagination(),
        ));
  }
}

enum PageIndicatorLayout {
  NONE,
  SLIDE,
  WARM,
  COLOR,
  SCALE,
  DROP,
}
