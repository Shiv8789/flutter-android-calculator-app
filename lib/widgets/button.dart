import 'dart:ui';

import 'package:flutter/material.dart';

class Cbutton extends StatelessWidget {
  final String? num;
  final Function? setinput;
  const Cbutton({Key? key, this.num, this.setinput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 70,
      
      child: TextButton(
        child: Text(num.toString()),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
          textStyle: TextStyle(fontSize: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(90)),
          )
        ),
        onPressed: () {
          setinput!(num);
        },
      ),
    );
  }
}
