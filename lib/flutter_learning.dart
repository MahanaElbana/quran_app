import 'dart:html';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Location _location = new Location();
  late bool _serviceEnabled;
  late LocationData _locationData;
  late PermissionStatus _permissionStatus;
  getlocationData() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionStatus = await _location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await _location.requestPermission();
      if (_permissionStatus != PermissionStatus.denied) {
        return;
      }
    }
    _locationData = await _location.getLocation();
    print(_locationData);
    _location.onLocationChanged.listen((LocationData currentLocation) {
      print(currentLocation);
    });
  }

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        child: Text("get location "),
        onTap: getlocationData,
      ),
    ));
  }
}

//////////// the best Widgets in flutter //////////////////
/// [1]  SafeArea
/// [2]  Tooltip  
/// [3]  Expanded
/// [4]  Wrap
/// [5]  Opacity
/// [6]  FutureBuilder
/// [7]  FadeTransition
/// [8]  FloatingActionButton
/// [9]  PageView
/// [10] Table
/// [11] CustomScrollView
/// [12] SliverAppBar
/// [13] SliverList  
/// [14] SliverGrid
/// [15] FadeInImage
/// [15] FadeInImage