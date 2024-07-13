import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
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
                "images/pic1.jpg",
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
                height: 300,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  // Adjust the top padding here
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 20),
                              Text(
                                "WELCOME !!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
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
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 20),
                              Text(
                                "Let’s Protect your Child’s Health",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 20),
                              Text(
                                "using your Fingertips ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          // Adjust the height of SizedBox here
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 20,),
                              Container(
                                width: 220,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder:(_){
                                    //       return SigninPage();
                                    //     }
                                    // ));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(Colors.blueAccent.shade700),
                                  ),
                                  child: const Text(
                                      "Sign in", style: TextStyle(fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 30), // Adjust the width of SizedBox here
                      Column(

                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.black,
                            child: Image.asset(
                              "images/logow.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      )
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