const jwt = require('jsonwebtoken');
const User = require('../model/user');

const verifyToken = (req, res, next) => {
  const token = req.headers['authorization'];
  if (!token) {
    return res.status(401).json({ error: 'Token not provided' });
  }

  jwt.verify(token, 'secret_key', (err, decoded) => {
    if (err) {
      return res.status(401).json({ error: 'Invalid token' });
    }
    req.userId = decoded.id;
    next();
  });
};

const authorizeUser = async (req, res, next) => {
  try {
    const user = await User.findById(req.userId);
    if (!user) {
      return res.status(401).json({ error: 'User not found' });
    }
    if (!user.isAdmin) {
      return res.status(403).json({ error: 'Access denied. Admin permission required' });
    }
    next();
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};

module.exports = {
  verifyToken,
  authorizeUser,
};
