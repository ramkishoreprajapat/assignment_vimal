import 'dart:developer';

import 'package:flutter/material.dart';

import 'navigation_service.dart';

class Utility {
// if you want to show toast then use this method
  void showSnackBar(String msg) {
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(msg)));
  }

// print any of the value useing this method
  void debug(var value) {
    log(value);
  }
  
}
