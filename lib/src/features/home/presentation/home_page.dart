import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/dreams_data.dart';
import 'package:starter_app/src/features/home/presentation/wdigets/letter_detail_item.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: blogHeader.length,
        itemBuilder: (BuildContext context, int index) {
          final getContent = blogHeader[index]['BlogTitle'].toString();
          final getFirstLetter = getContent.split('နှင့်').first;
          final getSecondPhrase = getContent.split('နှင့်').last;
          final rp =
              getFirstLetter.replaceAll(RegExp(r'[#*)(@!,^&%.$\s]+'), '');
          final capitalLetter = rp[1];
          return LetterDetailitem(
            index: index,
            themeColor: context.colorScheme,
            capitalLetter: capitalLetter,
            textTheme: context.textTheme,
            getSecondPhrase: getSecondPhrase,
          );
        },
      ),
    );
  }
}
