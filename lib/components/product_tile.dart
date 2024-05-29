import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progetto_piattaforme_frontend/components/favorite_button.dart';
import 'package:progetto_piattaforme_frontend/entities/Product.dart';
import 'package:provider/provider.dart';

import '../managers/ShopManager.dart';

class ProductTile extends StatelessWidget{

  final Product product;

  const ProductTile({super.key, required this.product });

  @override
  Widget build(BuildContext context){

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,borderRadius: BorderRadius.circular(12)),
      
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(15),

      child: Column(



        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        AspectRatio(aspectRatio: 2,

        child: Container(

            decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            child: const Icon(Icons.face))),




          Text(product.name!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27
          ),),
          Text(product.description!,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
          ),),

          const Spacer(),
          Text("£${product.price!.toStringAsFixed(2)}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 18
          ),),

          Row(
            children: [
              IconButton(onPressed: () => addToCart(context), icon: SvgPicture.asset("assets/icons/add_to_cart.svg") ),
              
              const Spacer(),

              SizedBox(



                width: 40,
                height: 40,
                child: FavoriteButton(favorite: false),
              )
            ],
          )


        
        ],
      ),
    );


  }

  void addToCart(BuildContext context){
    showDialog(context: context, builder: (context)=>
        AlertDialog(
        content: const Text("Aggiungere al carrello?"),
        actions: [
          MaterialButton(onPressed: ()=> Navigator.pop(context),
          child: const Text("canccella")),

          MaterialButton(onPressed: () {
            Navigator.pop(context);
              context.read<ShopManager>().addToCart(product);
          },
          child: const Text("Si")),

        ],));
  }

}