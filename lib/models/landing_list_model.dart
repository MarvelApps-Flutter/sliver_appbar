import 'package:flutter/material.dart';
import 'package:flutter_sliver_appbar_module/color/material_color.dart';

class ChooseListModel
{
  final Color? colors;
  final String? text;

  ChooseListModel({this.colors, this.text});

}

List<ChooseListModel> chooseList = [
  ChooseListModel(
      colors: createMaterialColor(Color(0xFFff735c)),
      text: "Pinned Sliver"),
  ChooseListModel(
      colors: createMaterialColor(Color(0xFFff735c)),
      text: "Float with Snap Sliver"),
  ChooseListModel(
      colors: createMaterialColor(Color(0xFFff735c)),
      text: "Float without Snap Sliver"),
  ChooseListModel(
      colors: createMaterialColor(Color(0xFFff735c)),
      text: "Tab bar Sliver"),
  ChooseListModel(
      colors: createMaterialColor(Color(0xFFff735c)),
      text: "Persistent Header Sliver"),
];
