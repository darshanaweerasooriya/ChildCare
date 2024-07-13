import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartchildcare/pages/loging.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class singup extends StatefulWidget {
  const singup({Key? key}) : super(key: key);

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phnum = TextEditingController();
  final bool _isNotvalidate = false;
  Future<void> signUp() async {
    final Uri uri = Uri.parse('http://10.0.2.2:3000/registration');
    final Map<String, dynamic> userData = {
      'Username': usernameController.text,
      'Email': useremail.text,
      'password': password.text,
      'phonenumb': phnum.text,
    };

    try {
      final http.Response response = await http.post(
        uri,
        body: jsonEncode(userData),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // Successfully registered

        // Navigate to another page or show success message
      } else {
        // Failed to register

        // Show error message or handle accordingly
      }
    } catch (error) {
      print('Error registering: $error');
      // Handle error, show error message or retry logic
    }
  }




  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Container for the image
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Image.asset(
                "images/lh.jpg",
                fit: BoxFit.cover,
              ),
            ),
            // Container for the text
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 400,
                height: 500,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  // Adjust the top padding here
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Welcome Back ! ",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Smart Child Care",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Register to secure the health of your child",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "for the better future. ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      const Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "User Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: 20), // Add spacing between text and TextField
                          Container(
                            width: 350,
                            height: 35,
                            child: Expanded(
                              child: TextField(
                                controller: usernameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  errorStyle: TextStyle(color: Colors.white),
                                  errorText: _isNotvalidate ? "Enter proper Info": null,
                                  border: OutlineInputBorder(),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      const Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: 20), // Add spacing between text and TextField
                          Container(
                            width: 350,
                            height: 35,
                            child: Expanded(
                              child: TextField(
                                controller: useremail,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  errorStyle: TextStyle(color: Colors.white),
                                  errorText: _isNotvalidate ? "Enter proper Info": null,
                                  border: OutlineInputBorder(),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      const Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Passowrd",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                      SizedBox(width: 20,),
                      Row(
                        children: [
                          SizedBox(width: 20), // Add spacing between text and TextField
                          Container(
                            width: 350,
                            height: 35,
                            child: Expanded(
                              child: TextField(
                                controller: password,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  errorStyle: TextStyle(color: Colors.white),
                                  errorText: _isNotvalidate ? "Enter proper Info": null,
                                  border: OutlineInputBorder(),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      const Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Phone number ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                      SizedBox(width: 20,),
                      Row(
                        children: [
                          SizedBox(width: 20), // Add spacing between text and TextField
                          Container(
                            width: 350,
                            height: 35,
                            child: Expanded(
                              child: TextField(
                                controller: phnum,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  errorStyle: TextStyle(color: Colors.white),
                                  errorText: _isNotvalidate ? "Enter proper Info": null,
                                  border: OutlineInputBorder(),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25),
                      // Adjust the height of SizedBox here
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),
                          Container(
                            width: 220,
                            child:
                            ElevatedButton(
                              onPressed: signUp,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.blueAccent.shade700),
                              ),
                              child: const Text("Sign Up", style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),
                          Container(
                              width: 220,
                              child:Row(
                                children: [
                                  SizedBox(width: 40,),
                                  Text("Already a member "),
                                  GestureDetector(
                                      onTap: (){
                                        // Navigator.push(
                                        //     context, MaterialPageRoute(
                                        //   builder: (context) => singinpage(),
                                        // ));

                                      },
                                      child: Text("Sign in",style: TextStyle(color: Colors.blueAccent),))
                                ],
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }

