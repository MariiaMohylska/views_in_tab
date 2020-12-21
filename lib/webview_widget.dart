import 'dart:async';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  WebViewWidget({Key key}): super(key: key);
  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget>{
  final String url = "https://flutter.dev/?gclid=CjwKCAiArIH_BRB2EiwALfbH1JtErfaRsgJpXLmhDfx1_btbWiUEWDTARZukAReNiRPYlw9Gpj6k5hoCqGoQAvD_BwE&gclsrc=aw.ds";
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }
  static Future<String> get _url async {
    await Future.delayed(Duration(seconds: 1));
    return 'https://flutter.dev/';
  }

  @override
  void dispose() {
    _WebViewWidgetState();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        isLoading ? LinearProgressIndicator() : Stack(),
      ],
    );
  }

}
