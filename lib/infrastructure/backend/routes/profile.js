const express = require('express');
const router = express.Router();
const { verifyToken, authorizeUser } = require('../middleware/authMiddleware');


// the codes in this case are used for the user and admin authentication

router.get('/admin', verifyToken, authorizeUser, (req, res) => {
  res.status(200).json({ message: 'Admin profile accessed successfully' });
});


router.get('/user', verifyToken, (req, res) => {
  res.status(200).json({ message: 'User profile accessed successfully' });
});

module.exports = router;
