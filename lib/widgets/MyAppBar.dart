import 'package:flutter/material.dart';
import 'package:savings_app/design/PaletteColors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  MyAppBar({Key key, this.text}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.text),
//      backgroundColor: PaletteColors.primary,
      elevation: 4.0,
      centerTitle: true,
      textTheme: TextTheme(
          title: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      )),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
