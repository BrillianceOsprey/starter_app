import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/cart/presentation/cart_detail_page.dart';
import 'package:starter_app/src/shared/constants/app_size.dart';
import 'package:starter_app/src/shared/utils/extensions/media_query_extension.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.inversePrimary,
        title: const Text('Cart(5)'),
        actions: const [
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 12,
          ),
          Icon(Icons.message),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartDetailPage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: SizedBox(
                child: Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: context.colorScheme.onBackground,
                        ),
                        color: context.colorScheme.background,
                      ),
                    ),
                    gapW12,
                    Container(
                      // width: context.screenWidth * 0.3,
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'http://13.228.29.1/productAllImage/SHATDX003.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    gapW12,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // title
                          Text(
                            'Name of product',
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyMedium,
                          ),
                          Text(
                            'Qty: 10',
                            style: context.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          gapH12,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('MMK 12000'),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: context.colorScheme.background,
                                    child: const Icon(Icons.delete_outline),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      color: context.colorScheme.background,
                                      child: const Center(
                                        child: Text('1'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: context.colorScheme.background,
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
