import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/home_page/products_page/product_card.dart';
import 'package:shop_app/provider/product_provider.dart';
import 'package:shop_app/product_details_page/product_details_page.dart';

class ProductListHome extends StatefulWidget {
  const ProductListHome({super.key});

  @override
  State<ProductListHome> createState() => _ProductListHomeState();
}

class _ProductListHomeState extends State<ProductListHome> {
  final List filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  final TextEditingController _searchBarController = TextEditingController();
  final border = OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
    borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
  );

  late String selectedFilter;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
    Future.microtask(() {
      context.read<ProductProvider>().setProducts(products);
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchedProducts = context.watch<ProductProvider>().products;

    final filteredProducts = selectedFilter == 'All'
        ? searchedProducts
        : searchedProducts.where((product) {
            return product['company'] == selectedFilter;
          }).toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                Expanded(
                  child: SearchBar(
                    hintText: 'Search',
                    leading: Icon(Icons.search),

                    controller: _searchBarController,
                    onChanged: (value) {
                      context.read<ProductProvider>().searchProducts(value);
                    },
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromRGBO(245, 247, 249, 1),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        label: Text(filter),
                        labelStyle: const TextStyle(fontSize: 16),
                        side: BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  final products = filteredProducts;

                  return ListView.builder(
                    itemCount: products.length,

                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
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
