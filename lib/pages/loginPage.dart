
import 'package:flutter/material.dart';
import 'package:progetto_piattaforme_frontend/managers/ShopManager.dart';
import 'package:progetto_piattaforme_frontend/managers/UserManager.dart';
import 'package:progetto_piattaforme_frontend/pages/registerPage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  _LoginPageState createState() => _LoginPageState();




}



class _LoginPageState extends State<LoginPage>{

  bool isLoading = false;


   final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ShopManager shop = context.watch<ShopManager>();

    return Scaffold(

      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: SizedBox(
          width: 900,
          child: Column(



            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(

                controller: _usernameController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(fontSize: 30),
                  labelText:"email",
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(fontSize: 30),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 40),
              isLoading? const Center(child: CircularProgressIndicator()):
                  Column(children: [
                    ElevatedButton(

                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          String? token = await login(_usernameController.value.text, _passwordController.value.text,shop);
                          if(token == null){showAlertError(context);}else{showAlertSuccess(context);}
                          setState(() {
                            isLoading = false;
                          });
                          },
                        child: const Text('Login',style: TextStyle(fontSize: 30),)
                    ),

                    const SizedBox(height: 10
                    ),
                    ElevatedButton(

                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));},
                        child: const Text('Register',style: TextStyle(fontSize: 30),)
                    ),
                  ],)

            ],
          ),
        ),
      ),
    );
  }


  Future<String?> login(String username, String password,ShopManager shop) async {

    String? token = await UserManager().login(username, password);
    shop.updateLogin();
    shop.updateShop();
    return token;
  }

  void showAlertError(BuildContext context){
    showDialog(context: context, builder: (context)=>
    AlertDialog(
      content: const Text("Utente non trovato"),
      actions: [
        MaterialButton(onPressed: ()=> Navigator.pop(context),
            child: const Text("OK")),

      ],));

  }

  void showAlertSuccess(BuildContext context){
    showDialog(context: context, builder: (context)=>
        AlertDialog(
          content: const Text("Entrato con successo"),
          actions: [
            MaterialButton(onPressed: () {Navigator.pop(context);
            Navigator.pop(context);},
                child: const Text("OK")),

          ],));

  }



}



