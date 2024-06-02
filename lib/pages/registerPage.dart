import 'package:flutter/material.dart';
import 'package:progetto_piattaforme_frontend/managers/UserManager.dart';
import 'package:progetto_piattaforme_frontend/support/keycloak/accessTokenRequest.dart';
import 'package:provider/provider.dart';

import '../entities/User.dart';
import '../managers/ShopManager.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});


  @override
 _RegisterPageState createState() => _RegisterPageState();



}

  class _RegisterPageState extends State<RegisterPage>{


    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _firstNameController = TextEditingController();
    final _surnameController = TextEditingController();
    final _phoneNumberController = TextEditingController();
    final _addressController = TextEditingController();

    bool isLoading = false;




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
                  labelText:"Email",
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
              const SizedBox(height: 25),
              TextField(

                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(fontSize: 30),
                  labelText:"First Name",
                ),
              ),
              const SizedBox(height: 25),
              TextField(

                controller: _surnameController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(fontSize: 30),
                  labelText:"Surname",
                ),
              ),
              const SizedBox(height: 25),
              TextField(

                controller: _addressController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(fontSize: 30),
                  labelText:"Address",
                ),
              ),
              const SizedBox(height: 25),
              TextField(

                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(fontSize: 30),
                  labelText:"Phone Number",
                ),
              ),
              const SizedBox(height: 40),


            isLoading? const Center(child: CircularProgressIndicator()):
              ElevatedButton(

                  onPressed:() async {

                    setState(() {
                      isLoading = true;
                    });
                    String? response = await registerUser(
                      _usernameController.text,
                      _passwordController.text,
                      _firstNameController.text,
                      _surnameController.text,
                        _addressController.text,
                        _phoneNumberController.text,shop);
                    if(response == null){
                      showAlertError(context);
                    }else{showAlertSuccess(context);

                    }

                    setState(() {
                      isLoading = false;
                    });
                  },

                  child: const Text('Register',style: TextStyle(fontSize: 30),)
              ),

            ],
          ),
        ),
      ),
    );
  }

/*



  }
  */

  Future<String?> registerUser(String username,String password,String firstName,String surname,String address, String phoneNumber, ShopManager shop) async {

    User user = User(email: username,firstName: firstName,lastName: surname,telephoneNumber: phoneNumber,address: address);

    String? token = await AccessTokenRequest.getAccessToken();



    String? response = await UserManager().register(user, password, token!);
    shop.updateLogin();
    return response;


  }
    void showAlertError(BuildContext context) {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            content: const Text("Errore registrazione"),
            actions: [
              MaterialButton(onPressed: () => Navigator.pop(context),
                  child: const Text("OK")),

            ],));
    }
      void showAlertSuccess(BuildContext context){
        showDialog(context: context, builder: (context)=>
            AlertDialog(
              content: const Text("Entrato con successo"),
              actions: [
                MaterialButton(onPressed: () {Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);},
                    child: const Text("OK")),

              ],));

      }

}



/*


*/








