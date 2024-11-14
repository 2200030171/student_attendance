const express = require('express');
const app = express();
const cors = require('cors');
const PORT = 3000;

app.use(cors());
app.use(express.json()); // To parse JSON bodies

// In-memory array to store student data
let students = [];

// POST route to add a student
app.post('/add-student', (req, res) => {
  const { name, rollNumber } = req.body;

  if (!name || !rollNumber) {
    return res.status(400).json({ message: 'Name and Roll Number are required.' });
  }

  const newStudent = { name, rollNumber };
  students.push(newStudent); // Add student to the array

  res.status(201).json({ message: 'Student added successfully', student: newStudent });
});

// GET route to retrieve all students
app.get('/students', (req, res) => {
  res.status(200).json(students);
});

// PUT route to update a student
app.put('/update-student/:rollNumber', (req, res) => {
  const { rollNumber } = req.params;
  const { name } = req.body;

  const student = students.find(student => student.rollNumber == rollNumber);
  if (!student) {
    return res.status(404).json({ message: 'Student not found' });
  }

  student.name = name || student.name;
  res.status(200).json({ message: 'Student updated successfully', student });
});

// DELETE route to remove a student
app.delete('/delete-student/:rollNumber', (req, res) => {
  const { rollNumber } = req.params;

  students = students.filter(student => student.rollNumber != rollNumber);
  res.status(200).json({ message: 'Student deleted successfully' });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
