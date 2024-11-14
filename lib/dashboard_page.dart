import 'package:flutter/material.dart';
import 'subjects_page.dart';

class Student {
  final String name;
  final String id;
  final String course;

  Student({required this.name, required this.id, required this.course});
}

class DashboardPage extends StatelessWidget {
  final List<Student> students = [
    Student(name: 'Sumanth Thota', id: '30160', course: 'Computer Science'),
    Student(name: 'Bharath Madala', id: '30164', course: 'Mathematics'),
    Student(name: 'Swarna Mohanty', id: '30171', course: 'Physics'),
    Student(name: 'Pavithra Duddu', id: '30232', course: 'Chemistry'),
    Student(name: 'Nandini Kothapalli', id: '30961', course: 'Biology'),
    Student(name: 'Bhavya Vaka', id: '31675', course: 'History'),
    Student(name: 'Jayanth Meka', id: '32622', course: 'Literature'),
    Student(name: 'Nagalakshmi Mohanty', id: '31010', course: 'Computer Science'),
    Student(name: 'Kireeti Kandula', id: '31011', course: 'Mathematics'),
    Student(name: 'Brawny', id: '31237', course: 'Physics'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900], // Dark, classy color for AppBar
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.blueGrey[50], // Soft background color for a polished look
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/student_image.png'),
              backgroundColor: Colors.blueGrey[100],
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Card(
                    elevation: 3,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student Name: ${student.name}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[800],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Student ID: ${student.id}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[600],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Course: ${student.course}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubjectsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900], // Darker color for button
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'View Subjects',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
