import 'package:flutter/material.dart';

//import 'package:flutter_overboard/flutter_overboard.dart';

import 'package:get/get.dart';
import 'package:quran_app/Screens/home_page.dart';

void main() {
  runApp(QuranApp());
}

class QuranApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
