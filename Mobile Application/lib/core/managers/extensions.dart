import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  void addScreen(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void replaceScreen(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void popScreen() {
    Navigator.pop(this);
  }

  void popUntilScreen(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

}


extension ResponsiveDouble on num{
  double  width(BuildContext context) => this *  MediaQuery.sizeOf(context).width/375;
  double  height(BuildContext context) => this *  MediaQuery.sizeOf(context).height/812;
  double  ratioWidth(BuildContext context) => this *  MediaQuery.sizeOf(context).width;
  double  ratioHeight(BuildContext context) => this *  MediaQuery.sizeOf(context).height;

  double fontSize(BuildContext context) =>   MediaQuery.textScalerOf(context).scale(this*MediaQuery.sizeOf(context).width/375); // Usually, fonts are scaled based on width
}