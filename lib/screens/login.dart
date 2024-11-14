import 'package:final_ecommerce/screens/products.dart';
import 'package:final_ecommerce/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var providerObj = Provider.of<UserProvider>(context,listen: false);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Login',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 150,
                child: Image.asset('images/OIP.jpg')),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller:email,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email'
                              ),
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller:password,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password'
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              color: Colors.blueAccent,
                              width: 500,
                              child: TextButton(onPressed: (){
                                if(formKey.currentState!.validate()) {
                                  providerObj.Login(email: email, password: password);
                                  if(providerObj.status == true){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Products(),));
                                  }
                                }
                              }, child: Text('Login',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)),
                            )
                          ],

                        ))
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Didn\'t have an account? '),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Signup(),));
                }, child: Text('Register'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
