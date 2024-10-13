
import 'package:flutter/material.dart';
import 'package:progetto_piattaforme_frontend/components/my_appbar.dart';
import 'package:progetto_piattaforme_frontend/components/product_tile.dart';
import 'package:provider/provider.dart';
import 'package:progetto_piattaforme_frontend/managers/ShopManager.dart';

import '../entities/Product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});


  @override
  Widget build(BuildContext context) {
    ShopManager shop = context.watch<ShopManager>();
    List<Product> favorites = shop.favorites;

    return Scaffold(
        appBar: MyAppbar(),
        body: SingleChildScrollView(child:Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: shop.previousPage, icon: const Icon(Icons.arrow_back)),
                  IconButton(onPressed: shop.nextPage, icon: const Icon(Icons.arrow_forward))]),
            FutureBuilder<List<Product>>(
                future: shop.updateShopPaged(shop.currentPage,shop.pageSize),
                builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.hasData) {
                    List<Product>? products = snapshot.data!;
                    return GridView.builder(
                        shrinkWrap: true,

                        gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 700),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductTile(shop,product,favorites.contains(product));
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }) ],
        )));
  }
}
