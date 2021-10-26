import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:private_order/http/api.dart';

import 'http/http_model.dart';

class ArticleDetailPage extends StatefulWidget {
  final String url;

  ArticleDetailPage(this.url);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff8faf8),
          actions: [
            FutureBuilder<List<String>>(
                future: _getTaoKouLin(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return InkWell(
                      child: Icon(Icons.search),
                      onTap: () {
                        EasyLoading.showToast("正在解析淘口令...");
                      },
                    );
                  }

                  var data = snapshot.data;
                  return InkWell(
                    child: Icon(Icons.more_horiz),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ListView(
                              children: data.asMap().keys.map((i) {
                            var str = data[i];

                            if (str == null) {
                              return Container();
                            }

                            return Center(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 20.h, 0, 20.h),
                                child: InkWell(
                                  child: Text("$str"),
                                  onTap: () {
                                    FlutterClipboard.copy(str);
                                    _launchURL();
                                  },
                                ),
                              ),
                            );
                          }).toList());
                        },
                      );
                    },
                  );
                }),
            SizedBox(
              width: 40.w,
            )
          ],
        ),
        body: WebView(
          onWebViewCreated: (WebViewController webViewController) {
            // final String contentBase64 =
            // base64Encode(const Utf8Encoder().convert(model.html));
            // webViewController.loadUrl('data:text/html;base64,$contentBase64');
            _controller.complete(webViewController);
          },
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }

  _launchURL() async {
    String url = "taobao://";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static const String regExp =
      r"(\₰|\¥|\\(|\\)|\《|\￥|\€|\\$|\₤|\₳|\¢|\¤|\฿|\฿|\₵|\₡|\₫|\₲|\₭|£|\₥|\₦|\₱|\〒|\₮|\₩|\₴|\₪|\៛|\﷼|\₢|\ℳ|\₯|\₠|\₣|\₧|\ƒ)([a-zA-Z0-9]{11})(\₰|\¥|\\(|\\)|\《|\￥|\€|\\$|\₤|\₳|\¢|\¤|\฿|\฿|\₵|\₡|\₫|\₲|\₭|£|\₥|\₦|\₱|\〒|\₮|\₩|\₴|\₪|\៛|\﷼|\₢|\ℳ|\₯|\₠|\₣|\₧|\ƒ)"; //目前淘口令是11位

  Future<List<String>> _getTaoKouLin() async {
    var dio = getDio();
    var response = await dio.get(widget.url);
    var data = response.data;

    List<String> list = [];

    if (data == null) {
      return list;
    }
    var str = data.toString().trim();
    try {
      var regExpMatch = RegExp(regExp).allMatches(str);
      regExpMatch.forEach((element) {
        var start = element.start;
        var end = element.end;
        var substring = str.substring(start, end);
        list.add(substring.toString());
        print("tao:$substring");
      });
    } catch (e) {
      print(e);
    }

    return Future.value(list);
  }
}
