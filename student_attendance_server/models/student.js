// models/Student.js
const mongoose = require('mongoose');

// Define schema
const studentSchema = new mongoose.Schema({
    studentId: { type: String, required: true, unique: true },
    name: { type: String, required: true },
    status: { type: String, enum: ['present', 'absent', 'excused'], default: 'present' },
    date: { type: Date, default: Date.now }
});

// Create model
const Student = mongoose.model('Student', studentSchema);

module.exports = Student;
