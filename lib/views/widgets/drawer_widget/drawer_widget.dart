import 'package:flutter/material.dart';
import 'package:task_management_system/views/widgets/side_bar_component/side_bar_component.dart';
class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Drawer(
      child: SideBarComponent(),
    );
  }
}