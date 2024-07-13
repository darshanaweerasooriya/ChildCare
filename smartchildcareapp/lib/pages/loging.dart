import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartchildcare/pages/account.dart';
import 'dart:convert';

import 'config.dart';

class log extends StatefulWidget {
  const log({Key? key}) : super(key: key);

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  TextEditingController EmailCountoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();
  }
  
  void loginUser() async{
    if(EmailCountoller.text.isNotEmpty && passwordController.text.isNotEmpty){
      var reqbody ={
        "email":EmailCountoller.text,
        "password":passwordController.text
      };
      var response = await http.post(Uri.parse(login),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(reqbody)
      );
      var jsonResponse = jsonDecode(response.body);
      if(jsonResponse['status']){
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);
        Navigator.push((context), MaterialPageRoute(builder: (context)=>account(token: myToken)));
      }else{
        print("something wrong");
      }
    }
  }
  Future<void> loging() async{
    final url = Uri.parse('http://10.0.2.2:3000/login');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'Email': EmailCountoller.text,
          'password': passwordController.text,
        }),
        headers: {'Content-Type': 'application/json'},

      );
      final responseData = json.decode(response.body);
      if (responseData['status']== true){
        print('Login Success');
      }else{
        print('Loging Failed');
      }
    }catch(error){
      print('Error');
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                height: 450,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  // Adjust the top padding here
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      Row(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "We can secure the health of your child",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "for the better future ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
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
                                controller: EmailCountoller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
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
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(

                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              color: Colors.blueAccent.shade700,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 30),
                      // Adjust the height of SizedBox here
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20),
                          Container(
                            width: 220,
                            child: ElevatedButton(
                              onPressed: loginUser,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.blueAccent.shade700),
                              ),
                              child: const Text("Sign in", style: TextStyle(fontSize: 20)),
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
                                SizedBox(width: 20,),
                                Text("New to Secure the health ? "),
                                GestureDetector(
                                    onTap: (){
                                      // Navigator.push(
                                      //     context, MaterialPageRoute(
                                      //   builder: (context) => singinpage(),
                                      // ));

                                    },
                                    child: Text("Sign up",style: TextStyle(color: Colors.blueAccent),))
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