import 'package:flutter/material.dart';

extension DrawerExtension on BuildContext {
  void openDrawer() {
    Scaffold.of(this).openDrawer();
  }
}
