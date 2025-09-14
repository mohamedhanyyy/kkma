import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  const BubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [

          Image.asset('assets/images/bubble1.png'),
          Positioned(
              left: 0,
              child: Image.asset('assets/images/bubble2.png')),
        ],
      ),
    );
  }
}
