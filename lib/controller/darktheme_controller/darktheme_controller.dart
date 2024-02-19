import 'package:flutter/material.dart';
import 'package:poductivity_app/constants/colorconstant.dart';

class DarkthemeCpntroller extends ChangeNotifier {
  Color primarycolor = ColorConstant.primaryblack;
  Color secondrycolor = ColorConstant.primarywhite;

  bool darktheme = false;

  void changetheme() {
    darktheme = !darktheme;
    if (darktheme == true) {
      primarycolor = ColorConstant.primaryblack;
      secondrycolor = ColorConstant.primarywhite;
    }
    if (darktheme == false) {
      primarycolor = ColorConstant.primarywhite;
      secondrycolor = ColorConstant.primaryblack;
    }
    notifyListeners();
  }
}
