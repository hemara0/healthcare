import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareit/components/cartController.dart';

import '../../model/user.dart';
import '../../provider/provider.dart';
import 'cartProducts.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    // TextEditingController login_username = TextEditingController();
    // TextEditingController login_password = TextEditingController();
    List<TextEditingController> _login = [];
   //final List<TextEditingController> _controllers = [];
  @override
  Widget build(BuildContext context)
  {
    return 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Form(
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        
                         onSaved:(value){
                           _login.add(value as TextEditingController);
                         } ,
                        decoration: InputDecoration(

                          labelText: 'Username',
                          hintText: 'Enter Username',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),

                        onChanged: (String value)
                        {
                                      
                        },
                        
                        validator: (value)
                        
                        {
                          return value!.isEmpty ? 'Please enter your username' : null;
                        },
                      ),
                    ),
                    
                    SizedBox(height: 30,),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                         onSaved:(value){
                           _login.add(value as TextEditingController);
                         } ,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value)
                        {
                                      
                        },
                        validator: (value)
                        {
                          return value!.isEmpty ? 'Please enter your password' : null;
                        },
                      ),
                      
                    ),
                      
                    SizedBox(height: 30,),

                   
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: MaterialButton(
                        onPressed: () {
                          //Get.to(provider());
                           
                           print("Entered onPressed");
                           fetchUserLogin(_login[0],_login[1]);
                                    // Future.delayed(Duration(seconds: 1), () {
                                    //   login_username.clear();
                                    //   login_password.clear();
                                    // });

                                    



                        },
                        minWidth: double.infinity,
                        child: Text('Login'),
                        color :Colors.teal,
                        textColor: Colors.white,
                        ),
                    ),
                  ],
                ),),
              ),
            ],
          );
        
    
  }
  
}