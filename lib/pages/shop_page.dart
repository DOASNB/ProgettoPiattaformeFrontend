import 'package:flutter/material.dart';
import 'package:progetto_piattaforme_frontend/components/my_appbar.dart';
import 'package:progetto_piattaforme_frontend/components/product_tile.dart';
import 'package:provider/provider.dart';
import 'package:progetto_piattaforme_frontend/managers/ShopManager.dart';


class ShopPage extends StatelessWidget{
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context){

    final products = context.watch<ShopManager>().shop;
    return Scaffold(
      appBar: MyAppbar(),
      body:



            

            
        GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 700),
        itemCount: products.length,
        itemBuilder: (context,index)
        {
          final product = products[index];
          return ProductTile(product: product);
        })



    );
  }

}