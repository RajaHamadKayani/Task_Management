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
  int currentIndex = 0;
  List<Widget> list = [
    const HomeView(),
    const ProfileView(),
    const SettingsView(),
    const MenuView()
  ];
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
      body: list[currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              index == currentIndex;
            });
          },
          backgroundColor: Colors.teal,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: "Home",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              label: "Home",
            )
          ]),
    );
  }
}

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Menu"),
      ),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
