import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryPage extends StatefulHookConsumerWidget {
  const CategoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Categories'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text('category.productCategoryName'),
            leading: Image.network(
                'http://13.228.29.1/productAllImage/SHATDX003.jpg'),
            onTap: () {},
          );
        },
      ),
    );
  }
}
