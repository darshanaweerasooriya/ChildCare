import 'package:flutter/material.dart';
import 'package:smartchildcare/pages/Scan.dart';
import 'package:smartchildcare/pages/addpost.dart';
import 'package:smartchildcare/pages/dashborad.dart';


import '../pages/account.dart';

class tabbar extends StatefulWidget {
  const tabbar({Key? key}) : super(key: key);

  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  int index=0;
  final screen=[
    dashboard(),
    scan(),
    post(),
    account(),

  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: SafeArea(
            child: Scaffold(
              drawer: Drawer(
                child: Container(
                  color: Colors.black,
                  child: ListView(
                      children: [
                        ListTile(
                          leading: Icon(Icons.settings,color: Colors.white70,),
                          title: Text("Setting",style: TextStyle(color: Colors.white),),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.feedback,color: Colors.white70,),
                          title: Text("Feedback",style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          leading: Icon(Icons.info,color: Colors.white70,),
                          title: Text("About US",style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          title: Text("#####",style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          title: Text("#####",style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          title: Text("#####",style: TextStyle(color: Colors.white),),
                        )
                      ]
                  ),
                ),
              ),

              appBar: AppBar(
                backgroundColor: Colors.black,
                 title: Text("Home"),

              ),
              bottomNavigationBar: NavigationBarTheme(
                data: NavigationBarThemeData(
                  indicatorColor: Colors.white70,
                  labelTextStyle: MaterialStateProperty.all(
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                  ),
                ),child: NavigationBar(
                height: 55,
                selectedIndex: index,
                onDestinationSelected: (index) =>
                    setState(() => this.index=index),


                destinations: [
                  NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                  NavigationDestination(icon: Icon(Icons.search), label: "Search"),
                  NavigationDestination(icon: Icon(Icons.people), label: "Community"),
                  NavigationDestination(icon: Icon(Icons.account_circle), label: "Account"),

                ],
              ),

                  ),
              body: screen[index],
            ),
                )

              );

  }
}
