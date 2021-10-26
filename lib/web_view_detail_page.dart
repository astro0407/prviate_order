import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDetailPage extends StatefulWidget {
  final String url;

  WebViewDetailPage(this.url);

  @override
  _WebViewDetailPageState createState() => _WebViewDetailPageState();
}

class _WebViewDetailPageState extends State<WebViewDetailPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
            onWebViewCreated: (WebViewController webViewController) {
              // final String contentBase64 =
              // base64Encode(const Utf8Encoder().convert(model.html));
              // webViewController.loadUrl('data:text/html;base64,$contentBase64');
              _controller.complete(webViewController);
            },
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebResourceError: (error) {
              EasyLoading.showError(error.toString());
            },
            ));
  }

// _launchURL() async {
//   String url = "taobao://";
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
}
