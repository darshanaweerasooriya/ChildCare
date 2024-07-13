import 'package:flutter/material.dart';

class frgtpasswrd extends StatefulWidget {
  const frgtpasswrd({Key? key}) : super(key: key);

  @override
  State<frgtpasswrd> createState() => _frgtpasswrdState();
}

class _frgtpasswrdState extends State<frgtpasswrd> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailconfirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Forgot Passowrd")

          ),
          body:SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/psswrd.png",width: 250,),
                    Row(

                    )
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Text("Please Enter your Email address",style: TextStyle(fontSize: 25),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Text("to recovery your password",style: TextStyle(fontSize: 25),)
                  ],
                ),
                SizedBox(height: 50,),
                Form(
                    key: _formkey,
                    child: Container(
                      width: 370,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailconfirm,
                            decoration: InputDecoration(
                                label: Text("Email",style: TextStyle(color: Colors.black),),
                                prefixIcon: Icon(Icons.email_sharp)
                            ),

                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      child: ElevatedButton(

                        style: ButtonStyle(

                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),

                            ),
                          ),backgroundColor:MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {


                        },
                        child: const Text("Send",style: TextStyle(fontSize: 20),),

                      ),
                    ),
                  ],
                )


                // to recovery your password
              ],
            ),
          ),
        ));
  }
}



