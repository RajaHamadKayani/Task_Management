import 'package:flutter/material.dart';
import 'package:task_management_system/utils/app_styles/app_styles.dart';
import 'package:task_management_system/utils/responsive_layout/responsive_layout.dart';
import 'package:task_management_system/views/update_password/update_password.dart';

class ReusableListTile extends StatefulWidget {
  const ReusableListTile({super.key});

  @override
  State<ReusableListTile> createState() => _ReusableListTileState();
}

class _ReusableListTileState extends State<ReusableListTile> {
  navToScreens(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const UpdatePassword()));
      case 1:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const UpdatePassword()));
      case 2:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const UpdatePassword()));
      case 3:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const UpdatePassword()));
    }
  }

  List<String> listString = [
    "Change Password",
    "Travel Agent",
    "Settings",
    "Ticket History"
  ];
  List<IconData> iconDataList = [
    Icons.lock,
    Icons.travel_explore,
    Icons.settings,
    Icons.history,
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listString.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              navToScreens(index);
            },
            child: ClipRRect(
              child: SizedBox(
                height: !ResponsiveLayout.isMobile(context) ? 70 : 60,
                width: double.infinity,
                child: Card(
                  child: ListTile(
                    title: Text(
                      listString[index],
                      style: AppStyles.regularTextStyle(
                          color: Colors.black,
                          fontSize:
                              !ResponsiveLayout.isMobile(context) ? 20 : 16,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(
                      iconDataList[index],
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
