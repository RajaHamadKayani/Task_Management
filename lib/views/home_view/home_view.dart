import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_management_system/view_models/user_profile_data/user_profile_data.dart';
import 'package:task_management_system/views/widgets/text_widget/text_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print("Password of registered user: ${UserDataService.userPassword}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextWidget(
          title: "HomeView",
        ),
      ),
    );
  }
}
