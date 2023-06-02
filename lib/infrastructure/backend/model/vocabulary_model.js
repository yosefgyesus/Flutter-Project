const mongoose = require('mongoose');

// Define the vocabulary schema
const vocabularySchema = new mongoose.Schema({
  word: {
    type: String,
    required: true,
  },
  meaning: {
    type: String,
    required: true,
  },
  example: {
    type: String,
    required: true,
  },
});

// Create the Vocabulary model
const Vocabulary = mongoose.model('Vocabulary', vocabularySchema);

module.exports = Vocabulary;
