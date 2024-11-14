import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> addStudent(String name, int rollNumber) async {
  final url = Uri.parse('http://localhost:3000/add-student');
  final headers = {"Content-Type": "application/json"};
  final body = json.encode({"name": name, "rollNumber": rollNumber});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 201) {
    print('Student added successfully');
  } else {
    print('Failed to add student: ${response.body}');
  }
}
