import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: SafeArea(
          child: Scaffold(
            body: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User Name",style: TextStyle(fontSize: 15),),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("images/useraccnt.png",width: 100,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child:  Image.asset("images/message.jpg",width: 100,),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              child:  Image.asset("images/infor.png",width: 100,),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              child:  Image.asset("images/setting.png",width: 100,),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              child:  Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("images/his.png",width: 100,),
                                  Text("History")
                                ],
                              )
                            ),
                            Container(
                                width: 60,
                                height: 60,
                                child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("images/agent.png",width: 100,),
                                    Text("Contact us ")
                                  ],
                                )
                            ),
                            Container(
                                width: 60,
                                height: 60,
                                child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("images/about.png",width: 100,),
                                    Text("About us ")
                                  ],
                                )
                            )
                          ],
                        )

                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
