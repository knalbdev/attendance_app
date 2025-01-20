import 'package:face_recognition/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      // data diambil dari file google-services.json
      apiKey: 'AIzaSyDK2ebozBl3jeQp2C7YWlCjHDt9Q2GRc6s', // current_key 
      appId: '1:401662757068:android:297f3544c66fb992051a69', // mobilesdk_app_id 
      messagingSenderId: '401662757068', // project_number 
      projectId: 'github-config-cbd85' // project_id
    )
  );
  runApp(const AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: CardTheme(surfaceTintColor: Colors.white),
        dialogTheme: DialogTheme(surfaceTintColor: Colors.white, backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
      ),
      home: HomeScreen(),
    );
  }
}