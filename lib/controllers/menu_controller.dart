import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final menuControllerProvider = Provider((ref) => MenuController());

final scaffoldKeyProvider = Provider<GlobalKey<ScaffoldState>>((ref) {
  final menuController = ref.read(menuControllerProvider);
  return menuController.scaffoldKey;
});

class MenuController {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
