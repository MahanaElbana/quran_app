import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/components/constant.dart';
import 'package:quran_app/controller/controller.dart';

class Saurah extends StatelessWidget {
  Saurah({required this.aya, required this.index, required this.name});
  final List aya;
  final String index;
  final String name;

  ControllerApp _controllerApp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreenColor,
        centerTitle: true,
        title: DefaultTextStyleTransition(
          style: _controllerApp.animation,
          child: Text(
            "سورة ${name}",
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          /////
          Container(
            child: Center(
              child: Text(
                "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم",
                style: TextStyle(color: Colors.blueGrey, fontSize: 30),
              ),
            ),
          ),

          /////////// Card  ***** ////
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(9.0),
                child: RichText(
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    children: <TextSpan>[
                      ...(aya).map(
                        (e) => TextSpan(
                          text: "${e["_text"]} (${e["_index"]})",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 22),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          /////////// Card  ***** ////
        ],
      ),
    );
  }
}
