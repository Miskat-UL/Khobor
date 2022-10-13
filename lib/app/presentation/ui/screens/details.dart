import 'dart:io';

import 'package:flutter/material.dart';
import 'package:khobor/app/data/models/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Details extends StatefulWidget {
  // final Articles data;
  final String? url;
  const Details(this.url, {Key? key}) : super(key: key);

  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  bool isLoading = true;
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child:isLoading? const Center(child: CircularProgressIndicator(),) : WebView(

          initialUrl: widget.url,
          allowsInlineMediaPlayback: true,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished:(progress) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      ),
    );
  }
}
