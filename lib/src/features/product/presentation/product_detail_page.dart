import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProductDatailPage extends StatefulHookConsumerWidget {
  final String productCode;
  final String erpCode;
  final String productName;
  final String price;
  final String imageUrl;
  const ProductDatailPage(this.productCode, this.erpCode, this.productName,
      this.price, this.imageUrl,
      {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDatailPageState();
}

class _ProductDatailPageState extends ConsumerState<ProductDatailPage> {
   List<String> productList = [
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.imageUrl,
              height: 200, // Adjust the height as needed
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              widget.productName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('ERP Code: ${widget.erpCode}'),
            const SizedBox(height: 8),
            Text('Price: ${widget.price}'),
            const SizedBox(height: 16),
            // Add more details or components as needed
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(productList[index]),
                    // You can add more details or customize the list item as needed
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
