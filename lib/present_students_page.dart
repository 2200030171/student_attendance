import 'package:flutter/material.dart';

class PresentStudentsPage extends StatelessWidget {
  final List<Map<String, dynamic>> presentStudents;

  PresentStudentsPage({required this.presentStudents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Present Students'),
      ),
      body: ListView.builder(
        itemCount: presentStudents.length,
        itemBuilder: (context, index) {
          final student = presentStudents[index];
          return ListTile(
            title: Text('Student ID: ${student['studentId']}'),
            subtitle: Text('Date: ${student['date']}, Time: ${student['hours']}'),
            trailing: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }
}
