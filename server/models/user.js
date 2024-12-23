require('dotenv').config()
const mongoose = require('mongoose');

mongoose.connect(process.env.DB_URI);

const userSchema = mongoose.Schema({
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  mobileNumber: { type: String, required: true, unique: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  isHealthcareProvider: { type: Boolean, required: true }
});



const User = mongoose.model('User', userSchema);

module.exports = User;
