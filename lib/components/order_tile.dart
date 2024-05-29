import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progetto_piattaforme_frontend/entities/Product.dart';

import '../entities/Order.dart';

class OrderTile extends StatelessWidget{
  final Order order;
  const OrderTile({super.key,required this.order});

  @override
  Widget build(BuildContext context){



    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)),
      child: AspectRatio(aspectRatio: 1,
    child:Column(crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Ordine numero:"+ order.id.toString(),textAlign: TextAlign.start,),

          Container(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
                 ),

              padding: const EdgeInsets.all(5),

              child:SizedBox(
                width: double.infinity,
                height: 200,
                child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
                itemCount: order.productInPurchase?.length,
                itemBuilder: (context,index)
                {
                  final  product = order.productInPurchase![index];

                  return Text("${product.product?.name}: ${product.quantity}");
                }),
              )
          )
        ],
      )

        ,




    ));
  }



}