import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:task_management_system/home_screen/home_screen.dart';
import 'package:task_management_system/utils/routes/route_settings.dart';
import 'package:task_management_system/utils/routes/routes_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:const  FirebaseOptions(
      apiKey: 'AIzaSyBmQ2kvq6cSD-xXtjKCrAb3i9nMZwFsIts',
      appId: '1:256364990197:android:95182afecc724887627fbc',
      messagingSenderId: '334890062485',
      projectId: 'task-management-system-3c1a3',
    ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: AppRouteSetting.routeSettings,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
