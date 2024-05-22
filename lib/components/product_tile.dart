import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progetto_piattaforme_frontend/components/favorite_button.dart';
import 'package:progetto_piattaforme_frontend/entities/product.dart';
import 'package:provider/provider.dart';

import '../entities/Shop.dart';

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
            padding: EdgeInsets.all(5),
            child: Icon(Icons.face))),




          Text(product.name!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27
          ),),
          Text(product.description!,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
          ),),

          const Spacer(),
          Text("£"+product.price!.toStringAsFixed(2),
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 18
          ),),

          Row(
            children: [
              IconButton(onPressed: () => addToCart(context), icon: SvgPicture.asset("assets/icons/add_to_cart.svg") ),
              
              Spacer(),

              Container(
                constraints: BoxConstraints(maxHeight: 60,maxWidth: 50),



                height: 30,
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
        content: Text("Aggiungere al carrello?"),
        actions: [
          MaterialButton(onPressed: ()=> Navigator.pop(context),
          child: Text("canccella")),

          MaterialButton(onPressed: () {
            Navigator.pop(context);
              context.read<Shop>().addToCart(product);
          },
          child: Text("Si")),

        ],));
  }

}