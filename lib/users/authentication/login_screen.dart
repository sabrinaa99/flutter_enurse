
import 'package:flutter/material.dart';
import 'package:flutter_php/signup.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();



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
                  onPressed: () async {},
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
                  onPressed: () {},
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

