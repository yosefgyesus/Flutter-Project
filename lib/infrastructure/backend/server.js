
// dotenv.config();
const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const dotenv = require("dotenv");
const app = express();

// Connect to MongoDB
mongoose.connect('mongodb://127.0.0.1:27017', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((error) => {
    console.error('Failed to connect to MongoDB', error);
  });



// // Connect to db
// mongoose
//   .connect(process.env["DATABASE"])
//   .then(() => console.log("connected to mongo db..."))
//   .catch((err) => console.log("Cannot connect to mongodb...", err));


// Middleware
app.use(bodyParser.json());

// API routes
app.use('/api', require('./routes'));

// Start the server
app.listen(3000, () => {
  console.log(`server is running on port http://localhost:${3000}`);
});
