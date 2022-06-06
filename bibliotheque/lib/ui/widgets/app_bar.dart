
import 'package:bibliotheque/theme/colors/light_colors.dart';

import 'package:flutter/material.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const AppBarr( this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: LightColors.kDarkBlue,
        elevation: 0,// ?
        title: Text(title),
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}