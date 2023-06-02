const express = require('express');
const router = express.Router();
const User = require('../model/user');
const admin=require('../model/admin_model')

router.post('/', async (req, res) => {
  try {
    const { name, email, password } = req.body;

    // Validate the data
    if (!name || !email || !password) {
      return res.status(400).json({ error: 'Full name, email, and password are required' });
    }

    // Check if the email is already registered
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(409).json({ error: 'Email is already registered' });
    }

    // Create a new user
    const user = new User({
      name,
      email,
      password,
    });


    

    // Save the user to the database
    await user.save();

    res.status(201).json({ message: 'User created successfully' });
  } catch (error) {
    console.error('Error creating user', error);
    res.status(500).json({ error: 'An error occurred while creating the user' });
  }
});

module.exports = router;
