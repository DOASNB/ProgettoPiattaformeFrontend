
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progetto_piattaforme_frontend/managers/ShopManager.dart';
import 'package:provider/provider.dart';

import '../pages/cartPage.dart';


class MyAppbar extends AppBar {

  MyAppbar({super.key});

  @override
  State<MyAppbar>createState() => _MyAppbarState();



}


class _MyAppbarState extends State<MyAppbar>{

  bool loggedIn = false;


  @override
  Widget build(BuildContext context) {
    ShopManager shopManager = context.watch<ShopManager>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Progetto piattaforme',
              style: TextStyle(color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"), onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage())
              );

          }),
          actions: <Widget>[
            IconButton(onPressed: () {shopManager.addProductToShop();},
                icon: SvgPicture.asset("assets/icons/login.svg"),
                constraints: const BoxConstraints(maxWidth: 60)),

          ],
        )
    );
  }





}





