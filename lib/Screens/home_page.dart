import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/Screens/quran_home_page.dart';
import 'package:quran_app/controller/controller.dart';
import 'package:quran_app/main.dart';

class HomePage extends StatelessWidget {
  /////////// pages ////////////////
  final List<PageModel> pages = <PageModel>[
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'assets/images/page1.jpg',
        title: 'أذكر الله',
        body: 'سبحان الله وبحمدة سبحان الله العظيم',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/images/page2.jpg',
        title: 'أذكر الله',
        body: 'سبحان الله وبحمدة سبحان الله العظيم',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/images/page3.jpg',
        title: 'أذكر الله',
        body: 'سبحان الله وبحمدة سبحان الله العظيم',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/images/page4.jpg',
        title: 'أذكر الله',
        body: 'سبحان الله وبحمدة سبحان الله العظيم',
        doAnimateImage: true),
  ];
  ////////////////////
  final ControllerApp _controllerApp = Get.put(ControllerApp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: OverBoard(
        nextText: "التالي",
        finishText: "أذهب الي التطبيق",
        skipText: "مرر لتخطي الصفحة",
        pages: pages,
        showBullets: true,
        finishCallback: () {
          Get.to(QuranHomePage());
        },
      ),
    );
  }
}
