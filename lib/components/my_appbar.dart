

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progetto_piattaforme_frontend/components/mustBeLoggedInAlert.dart';
import 'package:progetto_piattaforme_frontend/managers/ShopManager.dart';
import 'package:progetto_piattaforme_frontend/managers/UserManager.dart';
import 'package:progetto_piattaforme_frontend/pages/loginPage.dart';
import 'package:progetto_piattaforme_frontend/pages/orderPage.dart';
import 'package:progetto_piattaforme_frontend/support/Globals.dart';
import 'package:provider/provider.dart';

import '../pages/cartPage.dart';


class MyAppbar extends AppBar {

  MyAppbar({super.key});

  @override
  State<MyAppbar>createState() => _MyAppbarState();



}


class _MyAppbarState extends State<MyAppbar>{
  final TextEditingController _controller = TextEditingController();

  void _onSearchButtonPressed(ShopManager shopManager) {
    shopManager.updateShopSearch(_controller.text);
  }


  void showAlertLogout(BuildContext context,ShopManager shop){
    showDialog(context: context, builder: (context)=>
        AlertDialog(
            content: const Text("Logout?"),
            actions: [
              MaterialButton(onPressed: () {

                UserManager().reset();
                shop.updateLogin();
                Navigator.pop(context);
              },
                  child: const Text("SI")),
              MaterialButton(onPressed: () {

                Navigator.pop(context);

              },
                  child: const Text("Cancella"))

            ]));

  }


  @override
  Widget build(BuildContext context) {
        ShopManager shop = context.watch<ShopManager>();
        bool loggedIn = shop.loggedIn;


        return AppBar(
          title: const Text('Progetto piattaforme',
              style: TextStyle(color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"), onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage())
              );

          }),

          actions: <Widget>[





            IconButton(onPressed: () {

              loggedIn?
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage())):
              showDialog(context: context, builder: (context)=>MustBeLoggedInAlert.alert(context));

              },
                icon: Icon(Icons.add_card_outlined),
                constraints: const BoxConstraints(maxWidth: 60)),

            loggedIn?SizedBox(
                height: 40,

                child:Row(
                  children:
                  [
                    const Icon(Icons.accessibility,size: 40),

                    TextButton(
                        onPressed: (){
                          setState(() {
                            showAlertLogout(context,shop);
                          });} ,
                        child: Text("logged In as: ${userManager.user.email!}")
                    )
                  ]
                )
            ) :
            IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));},
                icon: Icon(Icons.login_outlined),
                constraints: const BoxConstraints(maxWidth: 60))


          ],
        );










  }





}





