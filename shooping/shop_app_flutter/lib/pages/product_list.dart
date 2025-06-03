import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filter = ['All', 'Nike', 'Addidas', 'Bata', 'Puma'];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      gapPadding: 4.0,
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                itemCount: filter.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filterBName = filter[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filterBName;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filterBName
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromRGBO(245, 247, 249, 1),
                        side:
                            BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        label: Text(filterBName),
                        labelStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, Constraints) {
                if (Constraints.maxWidth > 1000) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.8,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductDetailsPage(product: product);
                          }));
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          bgColor: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductDetailsPage(product: product);
                          }));
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          bgColor: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
