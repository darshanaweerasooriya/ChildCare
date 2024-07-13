import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class account extends StatefulWidget {
  final token;
  const account({@required this.token, Key? key}) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  late String Username;
  late String Email;
  late String phonenumb;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String,dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    Username = jwtDecodedToken['Username'];
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bkrr.png"),
                  fit: BoxFit.fill,
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Icon(Icons.logout,size: 40,color: Colors.red,),
                    // GestureDetector(
                    //   onTap: (){},
                    //   child: Text("LogOut",style: TextStyle(fontSize: 20,color: Colors.red),),
                    // )
                    SizedBox(width: 10,),
                    ElevatedButton(

                      style: ButtonStyle(

                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),

                          ),
                        ),backgroundColor:MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {

                      },
                      child: const Text("Log Out",style: TextStyle(fontSize: 20),),

                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Image.asset("images/useraccnt.png",width: 100,),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    GestureDetector(
                      onTap: (){
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder:(_){
                        //       return editaccount();
                        //     }
                        // ));
                      },
                      child:
                      Text("Edit Account ",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text(Username,style: TextStyle(fontSize: 20,color: Colors.grey.shade700),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Container(
                        width: 370,
                        height: 50,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10,),
                                Text("",style: TextStyle(fontSize: 20,color: Colors.red),),
                              ],
                            )
                          ],
                        )
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text("Email",style: TextStyle(fontSize: 20,color: Colors.grey.shade700),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                        width: 370,
                        height: 50,
                        color: Colors.white,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10,),
                                Text("",style: TextStyle(fontSize: 20,color: Colors.red),),
                              ],
                            )
                          ],
                        )
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text("Email",style: TextStyle(fontSize: 20,color: Colors.grey.shade700),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      width: 370,
                      height: 50,
                      color: Colors.white,

                    )
                  ],
                ),
                SizedBox(height: 10,),
                Divider(),
                Row(
                  children: [
                    SizedBox(width: 20,),

                    Text("Categories",style: TextStyle(fontSize: 20,color: Colors.grey.shade700),),
                    GestureDetector(
                      onTap: (){},
                      child: Icon(Icons.arrow_forward_ios) ,
                    )

                  ],
                )


              ],
            ),
          ),
        ));
  }
}
