import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageViewer extends StatefulWidget {
  const WebPageViewer({Key? key}) : super(key: key);

  @override
  _WebPageViewerState createState() => _WebPageViewerState();
}

class _WebPageViewerState extends State<WebPageViewer> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  int loadingPercentage = 0;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My portfolio website')),
      body: WebView(
        initialUrl: 'https:bhusalpramod.com.np',
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
      ),
    );
  }
}
