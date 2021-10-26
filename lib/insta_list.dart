import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'article_detail_page.dart';

class InstaList extends StatefulWidget {
  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  bool isPressed = false;

  static const List<String> usernames = [
    "Nanyou",
    "Nanyou",
    "LiveC",
  ];

  static const List<String> head_images = [
    "https://mmbiz.qpic.cn/mmbiz_jpg/OibQfvnjCgF587JWuKhj8Jic0hic3E0Zxwpg7eymPXtZ7ibdv5olOmI0IbkfFV3OK64QAECSibh5SZHYOic26ZqDTbHA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1",
    "https://mmbiz.qpic.cn/mmbiz_jpg/OibQfvnjCgF587JWuKhj8Jic0hic3E0Zxwpg7eymPXtZ7ibdv5olOmI0IbkfFV3OK64QAECSibh5SZHYOic26ZqDTbHA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1",
    "https://mmbiz.qpic.cn/mmbiz_jpg/hzIYNfXiabPUmEugVdxITOX7n3xV4IAf0fVDiaCNlZ0ufTwJPpra1Vf8Y2Gwa9sog0X1YibVP2G0HEOwKKAQSI8vg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1",
  ];

  static const List<List<String>> images = [
    [
      "https://mmbiz.qpic.cn/mmbiz_png/OibQfvnjCgF4SG2uEV3PMU8lZc39kSHpSsNdUHgZ1x3B2QsIszbkqbvHQ8chDzcfwBUP9Xgtruac6MBVoxF2GTA/640?wx_fmt=png"
    ],
    [ "https://mmbiz.qpic.cn/mmbiz_png/OibQfvnjCgF4ib9lITZejgwK9D45L8HqKUhdHewMwsiaia19Aeciaibmc0PKv1fkaBpdRmpR8QyxRTdWZ26YeJRwCibDg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1",
      "https://mmbiz.qpic.cn/mmbiz_png/OibQfvnjCgF5pwwxYniaW4Fnk0WpcjoMcgvW47tCBGfMWuVvHVaDEUcbCicgKhJTGV2s3nDoA6HyZKjb4VIukCLWw/0?wx_fmt=png"
    ],
    [
      "https://mmbiz.qpic.cn/mmbiz_jpg/hzIYNfXiabPUmEugVdxITOX7n3xV4IAf0PhicbnBblZ3XhNicA4gDq0zZcNuhSBCdqhBCbTPmLpKicedPSjjAlrnjg/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1",
      "https://mmbiz.qpic.cn/mmbiz_jpg/hzIYNfXiabPUmEugVdxITOX7n3xV4IAf016ibTiccTydA2x0kELzqNU0BcSMEybKtcn8pEzicTlJWYAb6RLKmDZtog/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1",
      "https://mmbiz.qpic.cn/mmbiz_jpg/hzIYNfXiabPUmEugVdxITOX7n3xV4IAf0fVDiaCNlZ0ufTwJPpra1Vf8Y2Gwa9sog0X1YibVP2G0HEOwKKAQSI8vg/640?wx_fmt=jpeg"
    ],
  ];

  static const List<String> urls = [
    "https://mp.weixin.qq.com/s/aX84ASw6IJhqzGy1EdPPTg",
    "https://mp.weixin.qq.com/s/4DqxJkVpmqjcTeT6ONc2HQ",
    "https://mp.weixin.qq.com/s/lpruGPAlnu2_ADj2oRKIPg",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: urls.length,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///头像栏
                Row(
                  children: [
                    Container(
                      height: 60.0.h,
                      width: 60.0.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(head_images[index])),
                      ),
                    ),
                    SizedBox(
                      width: 15.0.w,
                    ),
                    Text(
                      usernames[index],
                      style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                  onPressed: null,
                )
              ],
            ),
          ),
          Container(
            height: 500.h,
            child: Swiper(
                loop: false,
                itemCount: images[index].length,
                itemBuilder: (BuildContext context, int i) {
                  var image = images[index][i];
                  print(image);
                  return Image.network(
                    image,
                    fit: BoxFit.cover,
                  );
                },
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white30, activeColor: Colors.white, size: 15.0.sp, activeSize: 15.0.sp)),
                onTap: (i) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ArticleDetailPage(urls[index]),
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Icon(
                          isPressed ? Icons.favorite : FontAwesomeIcons.heart,
                          size: 45.sp,
                          color: isPressed ? Colors.red : Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      InkWell(
                        child: Icon(
                          FontAwesomeIcons.comment,
                          size: 45.0.sp,
                        ),
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      InkWell(
                        child: Icon(
                          FontAwesomeIcons.paperPlane,
                          size: 45.0.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  FontAwesomeIcons.bookmark,
                  size: 45.0.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
