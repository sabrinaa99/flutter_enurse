
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_php/qr_scanner.dart';
import 'package:flutter_php/users/authentication/signup.dart';
import 'package:flutter_php/users/fragments/dashboard_of_fragments.dart';
import 'package:flutter_php/users/userPreferences/user_preferences.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../api_connection/api_connection.dart';
import '../../users/model/user.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  loginUserNow() async
  {
    try
    {
      var res = await http.post(
        Uri.parse(API.login),
        body: 
        {
          //asign value user email and password
          'user_email': emailController.text.trim(),
          'user_password': passwordController.text.trim(),
        },
      );

    if(res.statusCode == 200)//200 means res(response) tu dah communicate succesfully
      { 
        var resBodyOfLogin = jsonDecode(res.body);
        //if response body true or false (check email and pass in db)
        //true = when user's email and pass is correct
        if(resBodyOfLogin['success'] == true)
        {
          Fluttertoast.showToast(msg: 'Successfully Login');

        //passing user data which contains user record in json format
        //so kene convert from json to nomat format
        //ni db user yg successfully login
          User userInfo = User.fromJson(resBodyOfLogin["userData"]);

          //pass info bout the user yg login successfully
          //save userInfo to local storage using Shared preferences
          await RememberUserPrefs.saveRememberUser(userInfo);

          Future.delayed(Duration(milliseconds: 2000),()
          {
            Get.to(DashboardOfFragments());
          });

        }
        else
        {
          Fluttertoast.showToast(msg: 'Incorrect Email or Password. Try again');
        }
      }
    }
    catch(errMsg)
    {
      print('Error: ' + errMsg.toString());
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Colors.grey[300],
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Login
            const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
            ),),
            
            const SizedBox(
              height: 15),

            //Text
            const Text(
              'Login to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
            ),),

            const SizedBox(
              height: 30,
            ),

            //Textfield
            Form(
              key: formKey,
              child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
                        width: 260,
                        height: 40,
                        child:TextFormField(
                          controller: emailController,
                          validator:(val) => val == "" ? "Please write email" : null,
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          )
                      ),),

                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
                        width: 260,
                        height: 40,
                        child: TextFormField(
                          controller: passwordController,
                          validator:(val) => val == "" ? "Please write password" : null,
                          decoration:const  InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          )
                      ),),

                      const SizedBox(
                        height: 20,
                      ),
                  ],
                ),
            ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child:SizedBox(
                  width: 260,
                  height: 40,
                  child: TextButton(
                  onPressed: ()
                  {
                    if (formKey.currentState!.validate())
                    {
                      loginUserNow();
                    }
                  },
                  child: const Text('Login'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey,),
                    ),
                ),),
              
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child:SizedBox(
                  width: 260,
                  height: 40,
                  child: TextButton(
                  onPressed: () 
                  {
                    Navigator.push(context, MaterialPageRoute (builder: (context) => QrScanner()));
                  },
                  child: const Text('Login QR Code'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey,),
                    ),
                ),),

              const SizedBox(
                height: 20,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute (builder: (context) => SignupScreen()));
                    },
                    child: Text(
                      ' Register now,',
                      style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
          ]
        )
      ),

        floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.network(
          'https://aphmconferences.com/wp-content/uploads/2022/04/Robopreneur-Logo.png',
          height: 20,
          width: 30,
        ),
        backgroundColor: Colors.grey[300],
      ),

    );
  }
}

