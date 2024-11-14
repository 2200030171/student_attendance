import 'package:flutter/material.dart';
import 'login_page.dart';  // Import the LoginPage
import 'dashboard_page.dart';  // Import the DashboardPage
import 'subjects_page.dart';  // Import the SubjectsPage

void main()
{

  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
        debugShowCheckedModeBanner: false,
    );
  }
}
