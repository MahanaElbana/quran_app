import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/components/constant.dart';

Widget appBarAll({animation, str, backgroundColor}) {
  return AppBar(
    backgroundColor: backgroundColor,
    title: DefaultTextStyleTransition(
      style: animation,
      child: Text(
        "${str}",
      ),
    ),
    centerTitle: true,
  );
}
