import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progetto_piattaforme_frontend/components/mustBeLoggedInAlert.dart';
import 'package:progetto_piattaforme_frontend/entities/Product.dart';
import 'package:progetto_piattaforme_frontend/managers/UserManager.dart';
import 'package:provider/provider.dart';

import '../managers/ShopManager.dart';

class ProductTile extends StatefulWidget {

  Product product = Product();
  bool favorite;
  ShopManager shopManager;


  ProductTile(this.shopManager,this.product, this.favorite,{super.key});




    @override
    _ProductTileState createState() => _ProductTileState();




}


class _ProductTileState extends State<ProductTile>{



  @override
  Widget build(BuildContext context){



    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,borderRadius: BorderRadius.circular(12)),
      
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(15),

      child: Column(



        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        AspectRatio(aspectRatio: 1.4,

        child: Container(

            decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            child:widget.product.imageName != null?Image.network(
              "assets/images/${widget.product.imageName}.jpg",
              fit: BoxFit.cover  ): const Icon(Icons.error_outline),
        ),
        ),




          Text(widget.product.name!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27
          ),),
          Text(widget.product.description!,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
          ),),

          const Spacer(),
          Text("€${widget.product.price!.toStringAsFixed(2)}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 18
          ),),

          Row(
            children: [
              IconButton(


                  onPressed: () => addToCart(context),
                  icon: widget.product.quantity!<=0? Icon(Icons.highlight_remove, color: Colors.black):Icon(Icons.add_shopping_cart,color: Colors.black,)
              ),
              
              const Spacer(),

              SizedBox(



                width: 40,
                height: 40,
                child:
                widget.favorite? IconButton(
                  onPressed: (){
                    if(UserManager().loggedIn){
                        setState(() {
                          widget.shopManager.removeFavorite(widget.product);
                          widget.favorite=false;
                        });
                    }else{
                      showDialog(context: context, builder: (context)=>MustBeLoggedInAlert.alert(context));
                    }

                  },
                  icon: const Icon(Icons.favorite,color: Colors.red),

                ):IconButton(
                  onPressed: (){
                    if(UserManager().loggedIn){
                      setState(() {
                        widget.shopManager.addFavorite(widget.product);
                        widget.favorite=true;
                      });
                    }else{
                      showDialog(context: context, builder: (context)=>MustBeLoggedInAlert.alert(context));
                    }

                  },
                  icon: const Icon(Icons.favorite_border,color: Colors.red),
              ))
            ],
          )


        
        ],
      ),
    );


  }

  void addToCart(BuildContext context){

    if(widget.product.quantity!<=0){
      quantityUnavailable(context);
      return;
    }

    showDialog(context: context, builder: (context)=>
        AlertDialog(
        content: const Text("Aggiungere al carrello?"),
        actions: [
          MaterialButton(onPressed: ()=> Navigator.pop(context),
          child: const Text("cancella")),

          MaterialButton(onPressed: () {
            Navigator.pop(context);
              context.read<ShopManager>().addToCart(widget.product);
          },
          child: const Text("Si")),

        ],));
  }
  void quantityUnavailable(BuildContext context){
    showDialog(context: context, builder: (context)=>
        AlertDialog(
          content: const Text("prodotto esaurito"),
          actions: [
            MaterialButton(onPressed: ()=> Navigator.pop(context),
                child: const Text("torna indietro")),

          ],));
  }

}