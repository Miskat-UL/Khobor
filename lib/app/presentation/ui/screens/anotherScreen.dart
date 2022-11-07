import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            VerticalDivider(
              color: Colors.white,
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
