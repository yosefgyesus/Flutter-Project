import 'package:flutter/material.dart';
import 'package:finalproject/domain/user/vocabulary/vocabulary.dart';
import 'package:finalproject/application/user/vocabulary/vocabulary_service.dart';

class VocabularyScreen extends StatefulWidget {
  final VocabularyService vocabularyService;

  VocabularyScreen({required this.vocabularyService});

  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _meaningController = TextEditingController();

  @override
  void dispose() {
    _wordController.dispose();
    _meaningController.dispose();
    super.dispose();
  }

  void _addVocabulary() async {
    final word = _wordController.text;
    final meaning = _meaningController.text;
    if (word.isNotEmpty && meaning.isNotEmpty) {
      final vocabulary = Vocabulary(
          id: 0,
          word: word,
          meaning: meaning); // Set a valid non-null value for id
      await widget.vocabularyService.addVocabulary(vocabulary);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vocabulary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _wordController,
              decoration: InputDecoration(labelText: 'Word'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _meaningController,
              decoration: InputDecoration(labelText: 'Meaning'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addVocabulary,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
