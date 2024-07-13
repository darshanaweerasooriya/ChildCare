import 'package:flutter/material.dart';
import 'package:smartchildcare/component/appbar.dart';
import 'package:smartchildcare/pages/Forgotpassword.dart';
import 'package:smartchildcare/pages/Scan.dart';
import 'package:smartchildcare/pages/account.dart';
import 'package:smartchildcare/pages/addpost.dart';
import 'package:smartchildcare/pages/community.dart';
import 'package:smartchildcare/pages/doctors.dart';
import 'package:smartchildcare/pages/loging.dart';
import 'package:smartchildcare/pages/signing.dart';
import 'package:smartchildcare/pages/welcomepage.dart';

void main (){
  runApp(myapp());
}

class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: log(),
    );
  }
}