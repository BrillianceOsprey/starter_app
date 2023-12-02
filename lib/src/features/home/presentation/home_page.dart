import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/category/presentation/category_page.dart';
import 'package:starter_app/src/features/home/presentation/widgets/home_product_grid_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  bool isShowSecondCategory = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          Text(
            'First Category',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    isShowSecondCategory = !isShowSecondCategory;
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Text(
                      'First Category',
                    ),
                  ),
                ),
              ),
            ),
          ),

          // second category list

          if (isShowSecondCategory)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Second Category',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CategoryPage(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                          child: Text(
                            'First Category',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          else
            const SizedBox(),

          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              // vertical: 16,
            ),
            child: HomeProductGridView(),
          ),
        ],
      ),
    );
  }
}
