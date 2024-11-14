
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'login.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var providerObj = Provider.of<UserProvider>(context,listen: false);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Register',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                              controller:name,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Name'
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Name is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10,),TextFormField(
                              controller:phone,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Phone'
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Phone is required';
                                }
                                return null;
                              }
                            ),
                            const SizedBox(height: 10,),TextFormField(
                              controller:email,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email'
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Email is required';
                                }
                                return null;
                              }
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: password,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password'
                              ),
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Password is required';
                                }
                                if(value.length < 8){
                                  return 'Password must be more than 8 chars';
                                }
                                if(value.length > 60){
                                  return 'Password must be less than 60 chars';
                                }
                                return null;
                              }
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              width: 500,
                              color: Colors.blueAccent,
                              child: TextButton(onPressed: (){
                                if(formKey.currentState!.validate()){
                                  if(providerObj.status == true){
                                  providerObj.SignUp(name: name.text, phone: phone.text, email: email.text, password: password.text);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Successful register...'))
                                    );
                                    Navigator.pop(context);
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Failed register...'))
                                    );
                                  }
                                }
                              }, child: Text('Sign up',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)),
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
                const Text('Already have an account? '),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

