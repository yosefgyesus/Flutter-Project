import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({Key? key}) : super(key: key);

  @override
  _NumberPageState createState() => _NumberPageState();
}

enum FilterType { known, unknown, all }

class _NumberPageState extends State<NumberPage> {
  List<String> geezNumbers = [
    '፩ Ahadu',
    '፪ kalitu',
    '፫ Selistu',
    '፬ Arbaitu',
    '፭ Hamstu',
    '፮ Sidistu',
    '፯ Sebaitu',
    '፰ Semistu',
    '፱ Tesirtu',
    '፲ Asirtu',
    '፳ Asira',
    '፴ Selasa',
    '፵ Arba',
    '፶ Hamsa',
    '፷ Sisa'
  ];
  List<String> englishnumber = [
    'One',
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten",
    "Twenty",
    "Thirty",
    "Fouty",
    "Fifty",
    "Sixty"
  ];

  late List<NumberItem> numbers = List.generate(
    15,
    (index) => NumberItem(index, geezNumbers[index], englishnumber[index]),
  );
  late List<NumberItem> filteredNumbers = List.from(numbers);

  FilterType filterType = FilterType.all;

  void filterNumbers() {
    setState(() {
      if (filterType == FilterType.all) {
        filteredNumbers = List.from(numbers);
      } else if (filterType == FilterType.known) {
        filteredNumbers = numbers.where((item) => item.isChecked).toList();
      } else if (filterType == FilterType.unknown) {
        filteredNumbers = numbers.where((item) => !item.isChecked).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back arrow button tap
          },
        ),
        title: const Text('Numbers'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: FilterType.all,
                              groupValue: filterType,
                              onChanged: (value) {
                                setState(() {
                                  filterType = value as FilterType;
                                  filterNumbers();
                                });
                              },
                            ),
                            const Text(
                              'All',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: FilterType.known,
                              groupValue: filterType,
                              onChanged: (value) {
                                setState(() {
                                  filterType = value as FilterType;
                                  filterNumbers();
                                });
                              },
                            ),
                            const Text(
                              'Known',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: FilterType.unknown,
                              groupValue: filterType,
                              onChanged: (value) {
                                setState(() {
                                  filterType = value as FilterType;
                                  filterNumbers();
                                });
                              },
                            ),
                            const Text(
                              'Unknown',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredNumbers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filteredNumbers[index].number,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          filteredNumbers[index].translation,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: Checkbox(
                          value: filteredNumbers[index].isChecked,
                          onChanged: (value) {
                            setState(() {
                              filteredNumbers[index].isChecked = value!;
                            });
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const VocabularyPage(),
                      //   ),
                      // );
                    },
                    child: const Text('View Vocabulary Lists'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NumberItem {
  final int id;
  final String number;
  final String translation;
  bool isChecked;

  NumberItem(this.id, this.number, this.translation, {this.isChecked = false});
}
