const express = require('express');
const adminRouter = express.Router();
const Admin = require('../model/admin_model');

const adminSignUp=async (req, res) => {
  try {
    const { name, email, password } = req.body;

    // Validate the data
    if (!name || !email || !password) {
      return res.status(400).json({ error: 'Full name, email, and password are required' });
    }

    // Check if the email is already registered
    const existingAdmin = await Admin.findOne({ email });
    if (existingAdmin) {
      return res.status(409).json({ error: 'Email is already registered' });
    }

    // Create a new Admin
    const admin = new Admin({
      name,
      email,
      password,
    });

    // Save the Admin to the database
    await admin.save();

    res.status(201).json({ message: 'Admin created successfully' });
  } catch (error) {
    console.error('Error creating Admin', error);
    res.status(500).json({ error: 'An error occurred while creating the Admin' });
  }
};

module.exports = adminSignUp;
