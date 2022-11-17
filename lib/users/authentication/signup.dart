import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_php/users/authentication/login_screen.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../api_connection/api_connection.dart';
import '../model/user.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  
  validateUserEmail() async
  {
    try
    {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': emailController.text.trim(),
        },
      );

      if(res.statusCode == 200)//200 meanse res(response) tu dah communicate succesfully
      { 
        var resBodyOfValidateEmail = jsonDecode(res.body);
        if(resBodyOfValidateEmail['emailFound'] == true)
        {
          Fluttertoast.showToast(msg: 'Email is already registered');
        }
        else
        {
          //register new user
          registerAndSaveUserRecord();
        }
      }
    }
    catch(e)
    {

    }
  }


  registerAndSaveUserRecord() async
  {
    User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    try
    {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if(res.statusCode == 200)
      {
        var resBodyOfSignUp = jsonDecode(res.body);
        if(resBodyOfSignUp['success'] == true)
        {
          Fluttertoast.showToast(msg:'Signup successfully');
        }
        else
        {
          Fluttertoast.showToast(msg: 'Error occured try again');
        }
      }
    }

    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
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
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
            ),),
            
            const SizedBox(
              height: 15),

            //Text
            const Text(
              'Register your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
            ),),
            
            const SizedBox(
              height: 10,
            ),

            Form(
              key: formKey,
              child: 
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
                        width: 260,
                        height: 40,
                        child: TextFormField(
                          controller: nameController ,
                          validator:(val) => val == "" ? "Please write username" : null,
                          decoration: InputDecoration(
                              hintText: 'Username',
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
                          controller: emailController ,
                          validator:(val) => val == "" ? "Please write email" : null,
                          decoration:const  InputDecoration(
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
                  onPressed: () {
                    if(formKey.currentState!.validate())
                    {
                      validateUserEmail();
                    }
                  },
                  child: const Text('Sign Up'),
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
                  Text('Already a member?'),
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    ' Login',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),),
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