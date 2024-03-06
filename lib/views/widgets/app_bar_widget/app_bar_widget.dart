import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarWdiget extends StatelessWidget implements PreferredSizeWidget {
  String? titl;
  Widget? leadingIcon;
  IconData? trailingIcon;
  CallbackAction? callbackAction;
  TextStyle? textStyle;

  AppBarWdiget({
    Key? key, // Fix the typo here
    this.leadingIcon,
    this.titl,
    this.trailingIcon,
    this.textStyle,
    this.callbackAction,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff00CEC9),
      centerTitle: false,
      title: Text(
        titl ?? "",
        style: textStyle,
      ),
      leading: leadingIcon,
      actions: [
        Icon(
          trailingIcon ?? null,
          color: Colors.black,
        ),
      ],
    );
  }
}
