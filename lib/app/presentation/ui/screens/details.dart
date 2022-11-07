import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khobor/app/data/models/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/connection/presentation/bloc/network_bloc.dart';
import '../../../../core/connection/presentation/bloc/network_state.dart';

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
      body: SafeArea(child:
          BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
        if (state is NetworkFailure) {
          print("fbasfbasbfasbfasdbasdl");
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('net nai vai')));
          return const SizedBox.shrink();
        } else if (state is NetworkSuccess) {
          print("fbasfbasbfasbfasdbasdl");
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('net nai vai')));
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 500,
                  child: WebView(
                    initialUrl: widget.url,
                    allowsInlineMediaPlayback: true,
                    // javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (progress) {
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          print("fbasfbasbfasbfasdbasdl");
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('net nai vai')));
          return Text('dont know');
        }
      })),
    );
  }
}
