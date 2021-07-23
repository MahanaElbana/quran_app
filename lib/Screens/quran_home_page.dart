import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/Screens/moshaph.dart';
import 'package:quran_app/components/constant.dart';
import 'package:quran_app/controller/controller.dart';
import 'package:quran_app/flutter_learning.dart';

class QuranHomePage extends StatelessWidget {
  Widget pages(context, fun, String str) {
    return GestureDetector(
      child: Card(
        elevation: 8.0,
        child: Container(
          color: kGreenColor,
          alignment: Alignment.center,
          height: 80.0,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20.0),
          child: Center(
              child: Text(
            "${str}",
            style: TextStyle(color: kWhiteColor, fontSize: 35.0),
          )),
        ),
      ),
      onTap: fun,
    );
  }

  final ControllerApp _control = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          title: Tooltip(
            message: "برنامج اسلامي تم تصميمه بواسطه المبرمج مهني البنا",
            child: DefaultTextStyleTransition(
              style: _control.animation,
              child: Text(
                "الصفحه الرئسية",
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            pages(context, () => Get.to(Moshaph()), "المصحف الشريف"),
            pages(context, () => Get.to(MyStatefulWidget()), "السبحة"),
            pages(context, () => Get.to(Moshaph()), "الأزكار"),
            pages(context, () => Get.to(Moshaph()), "الأحاديث"),
            pages(context, () => Get.to(Moshaph()), "الاعدادات"),
          ],
        ));
  }
}
