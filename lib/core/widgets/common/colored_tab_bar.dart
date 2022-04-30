import 'package:flutter/material.dart';
import 'package:urbanminded_assessment/core/constants/constants.dart';

class ColoredTabBar extends ColoredBox implements PreferredSizeWidget {
  const ColoredTabBar(
      {Key? key, this.background = AppColors.white, required this.tabBar})
      : super(key: key, color: background, child: tabBar);

  final Color background;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;
}
