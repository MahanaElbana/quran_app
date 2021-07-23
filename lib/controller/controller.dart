import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ControllerApp extends GetxController with SingleGetTickerProviderMixin {
  ///////////////     animation          /////////////////////////
  late AnimationController _animationController;
  late Animation<TextStyle> _animation;

  Animation<TextStyle> get animation => _animation;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat();
    _animation = TextStyleTween(
            begin: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
            end: TextStyle(
                color: Colors.green, fontSize: 28, fontWeight: FontWeight.bold))
        .animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
    _animationController
      ..addListener(() {
        update();
      });
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
  //////////   loading quran files        ////////////////

}
