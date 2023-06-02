const express = require('express');
const router = express.Router();
const User = require('../model/user');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

router.post('/', async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.findOne({ email });
    if (user) {
      if (await bcrypt.compare(password, user.password)) {
        const token = jwt.sign({ id: user._id }, 'secret_key');
        res.status(200).json({
          token,
          id: user._id,
        });
      } else {
        res.status(402).json({
          message: 'Invalid credentials',
        });
      }
    } else {
      res.status(401).json({
        message: 'User does not exist',
      });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: 'An error occurred while signing in' });
  }
});

module.exports = router;
