import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_piattaforme_frontend/entities/product.dart';

import '../entities/Order.dart';

class OrderTile extends StatelessWidget{
  final Order order;
  OrderTile({super.key,required this.order});

  @override
  Widget build(BuildContext context){


    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text("Ordine numero:"+ order.id.toString(),textAlign: TextAlign.start,),

          GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
              itemCount: order.productInPurchase!.length,
              itemBuilder: (context,index)
              {
                final  product = order.productInPurchase![index];
                return Text(product.product!.name!+" "+product.product!.quantity.toString());
              })
        ],
      )

        ,




    );
  }



}