
import 'package:flutter/material.dart';
import 'package:progetto_piattaforme_frontend/components/my_appbar.dart';
import 'package:progetto_piattaforme_frontend/components/product_tile.dart';
import 'package:provider/provider.dart';
import 'package:progetto_piattaforme_frontend/managers/ShopManager.dart';

import '../entities/Product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<StatefulWidget> createState() => ShopPageState();

}


class ShopPageState extends State<ShopPage>{

  final TextEditingController _controller = TextEditingController();

  void _onSearchButtonPressed(ShopManager shopManager) {
    shopManager.updateShopSearch(_controller.text);
  }
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    ShopManager shop = context.watch<ShopManager>();
    List<Product> favorites = shop.favorites;

    return Scaffold(
        appBar: MyAppbar(),
        body: SingleChildScrollView(child:Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center
                ,
                children: [
                  Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(

                        hintText: "ricerca",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        if(_controller.text!=""){
                        searching = true;
                        _onSearchButtonPressed(shop);}
                        else{searching=false;}
                      });

                    },
                  ),
              IconButton(onPressed: (){shop.previousPage();}, icon: const Icon(Icons.arrow_back)),
              IconButton(onPressed: (){shop.nextPage();}, icon: const Icon(Icons.arrow_forward))]),
            FutureBuilder<List<Product>>(
                future: searching?shop.productSearch(_controller.text)
                    :shop.updateShopPaged(shop.currentPage,shop.pageSize),
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
