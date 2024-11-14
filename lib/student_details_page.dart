import 'package:flutter/material.dart';

class StudentDetailsPage extends StatelessWidget {
  final String name;
  final String id;

  StudentDetailsPage({required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: $name",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              "ID: $id",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
