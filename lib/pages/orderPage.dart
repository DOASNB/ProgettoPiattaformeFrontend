import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progetto_piattaforme_frontend/components/order_tile.dart';
import 'package:progetto_piattaforme_frontend/managers/ShopManager.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget{

  OrderPage({super.key});


  @override
  Widget build(BuildContext context){

    final orders = context.watch<ShopManager>().orders;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.backspace_outlined),
          onPressed: () => Navigator.pop(context)
        )
      ),

      body: Expanded(
          child: SizedBox(
          
            child:ListView.builder(

            itemCount: orders.length,
            itemBuilder: (BuildContext context,int index) {

            return OrderTile(order: orders[index]);
          }))
    ),


    );



  }




}