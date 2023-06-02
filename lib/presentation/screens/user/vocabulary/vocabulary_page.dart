import 'package:finalproject/application/user/vocabulary/vocabulary_service.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/domain/user/vocabulary/vocabulary.dart';
//import 'package:finalproject/presentation/user/widgets/vocabulary_list.dart';
import 'vocabulary_screen.dart';
//import 'package:finalproject/application/user/vocabulary/vocabulary_service.dart';

class VocabularyPage extends StatefulWidget {
  final VocabularyService vocabularyService;

  VocabularyPage({required this.vocabularyService});

  @override
  _VocabularyPageState createState() => _VocabularyPageState();
}

class VocabularyList extends StatelessWidget {
  final List<Vocabulary> vocabularyList;

  VocabularyList({required this.vocabularyList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vocabularyList.length,
      itemBuilder: (context, index) {
        final vocabulary = vocabularyList[index];
        return ListTile(
          title: Text(vocabulary.word),
          leading: Text(vocabulary.meaning),
        );
      },
    );
  }
}

class _VocabularyPageState extends State<VocabularyPage> {
  List<Vocabulary> _vocabularyList = [];

  @override
  void initState() {
    super.initState();
    _loadVocabularyList();
  }

  void _loadVocabularyList() async {
    final vocabularyList = await widget.vocabularyService.getVocabularyList();
    setState(() {
      _vocabularyList = vocabularyList.cast<Vocabulary>();
    });
  }

  void _navigateToVocabularyScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            VocabularyScreen(vocabularyService: widget.vocabularyService),
      ),
    );

    if (result == true) {
      _loadVocabularyList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vocabulary Page'),
      ),
      body: VocabularyList(vocabularyList: _vocabularyList),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToVocabularyScreen(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
