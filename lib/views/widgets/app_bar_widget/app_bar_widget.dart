import 'package:flutter/material.dart';

class AppBarWdiget extends StatelessWidget implements PreferredSizeWidget {
  String? titl;
  IconData? leadingIcon;
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
      centerTitle: false,
      title: Text(
        titl ?? "",
        style: textStyle,
      ),
      backgroundColor: Colors.teal,
      leading: IconButton(
        onPressed: () {
          callbackAction!;
        },
        icon: Icon(
          leadingIcon ?? null,
          color: Colors.orange,
        ),
      ),
      actions: [
        Icon(
          trailingIcon ?? null,
          color: Colors.orange,
        ),
      ],
    );
  }
}
