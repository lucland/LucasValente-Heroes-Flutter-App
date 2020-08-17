import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "images/main_top.png",
              width: size.width * 0.2,
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "images/right_bottom.png",
              width: size.width * 0.6,
            ),
          ),
          child,
        ],
      ),
    );
  }
}