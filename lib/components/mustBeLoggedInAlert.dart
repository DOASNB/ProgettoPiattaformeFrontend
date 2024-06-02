import 'package:flutter/material.dart';

import '../pages/loginPage.dart';

class MustBeLoggedInAlert extends AlertDialog{
  const MustBeLoggedInAlert({super.key});




  static AlertDialog alert(BuildContext context){

      return AlertDialog(
      title: const Text("Deve aver fatto l'accesso per proseguire"),
      content: const Text("Vuole effetuare il login?"),
      actions: [
      TextButton(

      child: const Text('effetua login'),

      onPressed: () {




      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));

       },),

        TextButton(

          child: const Text('Torna indietro'),

          onPressed: () {




            Navigator.of(context).pop();


          },),


      ],
    );
  }


}