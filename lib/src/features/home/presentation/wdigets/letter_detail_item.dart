import 'package:flutter/material.dart';
import 'package:starter_app/dreams_data.dart';
import 'package:starter_app/src/features/home/presentation/dreams_detail_page.dart';

class LetterDetailitem extends StatelessWidget {
  const LetterDetailitem({
    required this.themeColor,
    required this.capitalLetter,
    required this.textTheme,
    required this.getSecondPhrase,
    required this.index,
    super.key,
  });

  final ColorScheme themeColor;
  final String capitalLetter;
  final TextTheme textTheme;
  final String getSecondPhrase;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          // ignore: inference_failure_on_instance_creation
          MaterialPageRoute(
            builder: (cxt) => DreamDetailPage(
              letter: capitalLetter,
              blogId: blogHeader[index]['BlogId'].toString(),
            ),
          ),
        );
      },
      child: Card(
        color: themeColor.secondaryContainer,
        child: Column(
          children: [
            Text(
              capitalLetter,
              style: textTheme.headlineMedium,
            ),
            Text(
              'နှင့်$getSecondPhrase',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
