import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareit/components/cartController.dart';

import '../../model/user.dart';
import '../../pages/homenav.dart';
import '../../provider/provider.dart';
import 'cartProducts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void initState() {
    super.initState();

    // Start listening to changes.
    user_controller.addListener(_printLatestValue);
    pass_controller.addListener(_printLatestValue);
  }

  void _printLatestValue() {}

  // TextEditingController login_username = TextEditingController();
  // TextEditingController login_password = TextEditingController();
  final user_controller = TextEditingController();
  final pass_controller = TextEditingController();
  // final List<TextEditingController> _login = [];
  //final List<TextEditingController> _controllers = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Login',
          style: TextStyle(
              fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold),
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
                    controller: user_controller,
                    // onSaved: (value) {
                    //   _login.add(value as TextEditingController);
                    // },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    // onFieldSubmitted: (String value) {
                    //   user_controller = value as TextEditingController?;
                    // },
                    // validator: ( value) {
                    //   print(value);
                    //   return value!.isEmpty
                    //       ? 'Please enter your username'
                    //       : null;
                    // },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,

                    // onSaved: (value) {
                    //   _login[0].text = value as String;
                    // },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    controller: pass_controller,
                    // onFieldSubmitted: (String value) {
                    //   pass_controller = value as TextEditingController?;
                    // },
                    // validator: (value) {
                    //   print('************************');
                    //   print(value);
                    //   return value!.isEmpty
                    //       ? 'Please enter your password'
                    //       : null;
                    // },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: MaterialButton(
                    onPressed: () {
                      //Get.to(provider());

                      print("Entered onPressed");
                      print(user_controller.text);
                      print(pass_controller.text);
                      // print(_login[1].text);
                      dynamic logindata = fetchUserLogin(
                          user_controller.text, pass_controller.text);
                      if (logindata[0]['validate'] == true) {
                        NavigationEx();
                      } else {
                        print('Wrong creds');
                      }
                      // Future.delayed(Duration(seconds: 1), () {
                      //   login_username.clear();
                      //   login_password.clear();
                      // });
                    },
                    minWidth: double.infinity,
                    child: Text('Login'),
                    color: Colors.teal,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
