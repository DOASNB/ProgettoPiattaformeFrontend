import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          Text("Ordine numero:${order.id}",textAlign: TextAlign.start,
          style: TextStyle(fontSize: 40),),

          Container(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
                 ),

              padding: const EdgeInsets.all(5),

              child:SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                itemCount: order.productsInPurchase?.length,


                itemBuilder: (context,index)
                {
                  final  product = order.productsInPurchase![index];

                  return Text("${product.product?.name} x${product.quantity}",
                  style: const TextStyle(fontSize: 30),);
                }),
              )
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(order.purchaseTime!).toString(),style: TextStyle(fontSize: 25),),
            ],
          )
        ],
      )

        ,




    ));
  }



}