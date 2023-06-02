const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const userSchema = new mongoose.Schema({
  fullName: String,
  email: String,
  password: String,
  role:{
    type:String,
    enum:['user','admin'],
    default:'user',
  },
});

userSchema.pre('save', async function (next) {
  try {
    const hashedPassword = bcrypt.hash(this.password, 10);
    this.password = hashedPassword;
    next();
  } catch (error) {
    next(error);
  }
});

module.exports = mongoose.model('User', userSchema);

