import 'package:flutter/material.dart';
import 'package:starter_app/src/features/product/presentation/product_detail_page.dart';
import 'package:starter_app/src/shared/utils/extensions/media_query_extension.dart';
import 'package:starter_app/src/shared/utils/flutter_extension.dart';

class HomeProductGridView extends StatelessWidget {
  const HomeProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(10));

    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        // return Container(
        //   decoration: const BoxDecoration(
        //     color: Color(0xFFD9D9D9),
        //     borderRadius: borderRadius,
        //   ),
        //   child: const Placeholder(),
        // );

        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProductDatailPage(
                  'productCode',
                  'erpCode',
                  'productName',
                  'price',
                  'http://13.228.29.1/productAllImage/SHATDX003.jpg',
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: borderRadius,
                ),
                child: Container(
                  // width: context.screenWidth * 0.3,
                  height: context.screenHeight * 0.15,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MMK 25000',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline),
                  ),
                ],
              ),
              Text(
                'Facial Foam',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'ERP5456s',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Text(
              //       'Only 10 items left',
              //       style: Theme.of(context).textTheme.titleSmall!.copyWith(
              //             fontWeight: FontWeight.bold,
              //           ),
              //     ),
              //     GestureDetector(
              //       onTap: () {},
              //       child: Container(
              //         margin: const EdgeInsets.only(
              //           top: 8,
              //           right: 8,
              //         ),
              //         decoration: BoxDecoration(
              //           color:
              //               context.colorScheme.onBackground.withOpacity(0.1),
              //           borderRadius: BorderRadius.circular(4),
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.all(2.0),
              //           child: Icon(
              //             Icons.shopping_cart_outlined,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        );
      },
    );
  }
}
