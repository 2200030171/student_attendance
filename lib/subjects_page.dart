import 'package:flutter/material.dart';

class SubjectsPage extends StatelessWidget {
  final List<String> subjects = [
    'Mathematics',
    'Science',
    'History',
    'Geography',
    'English',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subjects',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.blueGrey[50],
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(
                  subjects[index],
                  style: TextStyle(fontSize: 18, color: Colors.blueGrey[800]),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey[600]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendancePage(subject: subjects[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class AttendancePage extends StatefulWidget {
  final String subject;

  AttendancePage({required this.subject});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final List<Map<String, dynamic>> attendanceData = [
    {'studentId': '30160', 'name': 'Sumanth Thota', 'status': null},
    {'studentId': '30164', 'name': 'Bharath Madala', 'status': null},
    {'studentId': '30171', 'name': 'Swarna Mohanty', 'status': null},
    {'studentId': '30232', 'name': 'Pavithra Duddu', 'status': null},
    {'studentId': '30961', 'name': 'Nandini Kothapalli', 'status': null},
    {'studentId': '31675', 'name': 'Bhavya Vaka', 'status': null},
    {'studentId': '32622', 'name': 'Jayanth Meka', 'status': null},
    {'studentId': '31010', 'name': 'Nagalakshmi Mohanty', 'status': null},
    {'studentId': '31011', 'name': 'Kireeti Kandula', 'status': null},
    {'studentId': '31237', 'name': 'Brawny', 'status': null},
  ];

  String selectedHour = '10:00 AM';
  final List<String> hours = [
    '8:00 AM',
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.subject} Attendance',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.blueGrey[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Select Hours:',
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey[800]),
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedHour,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blueGrey[800]),
                  underline: Container(
                    height: 2,
                    color: Colors.blueGrey[800],
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedHour = newValue!;
                    });
                  },
                  items: hours.map<DropdownMenuItem<String>>((String hour) {
                    return DropdownMenuItem<String>(
                      value: hour,
                      child: Text(hour),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: attendanceData.length,
                itemBuilder: (context, index) {
                  final record = attendanceData[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      title: Text(
                        'Student ID: ${record['studentId']}',
                        style: TextStyle(fontSize: 18, color: Colors.blueGrey[800]),
                      ),
                      subtitle: Text(
                        'Name: ${record['name']}',
                        style: TextStyle(color: Colors.blueGrey[600]),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: record['status'] == true,
                            onChanged: (bool? value) {
                              setState(() {
                                record['status'] = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                List<Map<String, dynamic>> absentStudents = attendanceData
                    .where((student) => student['status'] != true)
                    .toList();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AbsentStudentsPage(absentStudents: absentStudents),
                  ),
                );
              },
              child: Text('Submit Attendance', style: TextStyle(color: Colors.white)), // Changed text color to white
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900],
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AbsentStudentsPage extends StatelessWidget {
  final List<Map<String, dynamic>> absentStudents;

  AbsentStudentsPage({required this.absentStudents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Absent Students',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.blueGrey[50],
        padding: const EdgeInsets.all(16.0),
        child: absentStudents.isEmpty
            ? Center(
          child: Text(
            'No absent students',
            style: TextStyle(fontSize: 18, color: Colors.blueGrey[800]),
          ),
        )
            : ListView.builder(
          itemCount: absentStudents.length,
          itemBuilder: (context, index) {
            final record = absentStudents[index];
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(
                  'Student ID: ${record['studentId']}',
                  style: TextStyle(fontSize: 18, color: Colors.blueGrey[800]),
                ),
                subtitle: Text(
                  'Name: ${record['name']}',
                  style: TextStyle(color: Colors.blueGrey[600]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
