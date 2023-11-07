import 'package:flutter/material.dart';
import 'package:starter_app/dreams_data.dart';
import 'package:starter_app/src/shared/constants/app_string.dart';

class DreamDetailPage extends StatefulWidget {
  const DreamDetailPage({
    required this.blogId,
    required this.letter,
    super.key,
  });
  final String blogId;
  final String letter;

  @override
  State<DreamDetailPage> createState() => _DreamDetailPageState();
}

class _DreamDetailPageState extends State<DreamDetailPage> {
  List<Map<String, dynamic>> _dream = [];

  Future<void> getDreamListById() async {
    final dream = details
        .where((element) => element['BlogId'].toString() == widget.blogId)
        .toList();
    setState(() {
      _dream = dream;
    });
  }

  @override
  void initState() {
    getDreamListById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.letter} နှင့်ပတ်သတ်သောအိပ်မက်များ'),
      ),
      body: ListView.builder(
        itemCount: _dream.length,
        itemBuilder: (context, index) {
          return LetterSpecificItemCard(
            index: index,
            themeColor: themeColor,
            content: _dream[index][blocContent].toString(),
          );
        },
      ),
    );
  }
}

class LetterSpecificItemCard extends StatelessWidget {
  const LetterSpecificItemCard({
    required this.themeColor,
    required this.content,
    required this.index,
    super.key,
  });

  final ColorScheme themeColor;
  final int index;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 50,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  index.toString(),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Card(
                color: themeColor.secondaryContainer,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Text(
                      content,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
