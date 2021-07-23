import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/Screens/saurah.dart';
import 'package:quran_app/components/constant.dart';
import 'package:quran_app/controller/controller.dart';

class Moshaph extends StatefulWidget {
  @override
  MoshaphState createState() => MoshaphState();
}

class MoshaphState extends State<Moshaph> {
  final ControllerApp _control = Get.find();

  List _item = [];
  Future<List> getQuranData() async {
    String response = await DefaultAssetBundle.of(context)
        .loadString("assets/quran/quran.json");
    var responsJson = json.decode(response);
    return responsJson["sura"];
  }

  @override
  void initState() {
    getQuranData().then((value) {
      setState(() {
        _item.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _item.isEmpty
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: kGreenColor,
                  pinned: true,
                  centerTitle: true,
                  snap: true,
                  floating: true,
                  expandedHeight: 160.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: DefaultTextStyleTransition(
                      style: _control.animation,
                      child: Text(
                        "المصحف الشريف",
                      ),
                    ),
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/page1.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(9.0),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: kGreenColor, width: 2)),
                          child: ListTile(
                            title: Text(
                              "[${index}] - سورة ${_item[index]["_name"]}",
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                        /////////
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Saurah(
                                aya: _item[index]["aya"],
                                index: _item[index]["_index"],
                                name: _item[index]["_name"],
                              ),
                            ),
                          );
                        },
                        ////////////////
                      );
                    },
                    childCount: _item.length,
                  ),
                ),
              ],
            ),
    );
  }
}
/* _item.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _item.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "[${index}] - سورة ${_item[index]["_name"]}",
                    textDirection: TextDirection.rtl,
                  ),
                );
              },
            ), */