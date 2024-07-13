import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class post extends StatefulWidget {
  const post({Key? key}) : super(key: key);

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    TextEditingController title = TextEditingController();
    TextEditingController descriptiom = TextEditingController();
    final bool _isNotvalidate = false;
    Future<void> post() async {
      final Uri uri = Uri.parse('http://10.0.2.2:3000/posting');
      final Map<String, dynamic> userData = {
        'Title': title.text,
        'Description': descriptiom.text

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
    final pickedfile = await _picker.getImage(source: source);
    if (pickedfile != null){
      setState(() {
        _imageFile = File(pickedfile.path);

      });


    } else {

    }

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: SafeArea(
          child: Scaffold(
            body: ListView(

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 5,),
                        Container(
                          width: 400,
                          height: 100,
                          color: Colors.white,

                            child: TextField(
                              controller: title,
                              decoration: InputDecoration(
                              
                                hintText: 'TItle',

                              ),
                            ),


                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 5,),
                        Container(
                          width: 400,
                          height: 500,
                          color: Colors.white,


                            child: SizedBox(
                              width: 400,
                                height: 400,
                              child: TextField(
                                controller: descriptiom,
                                decoration: InputDecoration(

                                  hintText: 'Decription',

                                ),

                          ),
                            ),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 5,),
                        Container(
                          width: 400,
                          height: 70,
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                            Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                                  spreadRadius: 3, // Spread radius
                                  blurRadius: 7, // Blur radius
                                  offset: Offset(0, 3), // Offset of the shadow
                                ),
                              ],
                            ),
                            child: IconButton(icon: Image.asset('images/gallery.png', width: 90,height: 90,),
                              onPressed: () {
                                _pickImage(ImageSource.gallery);
                              },
                            ),
                            ),
                              SizedBox(width: 20,),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Color of the shadow
                                      spreadRadius: 3, // Spread radius
                                      blurRadius: 7, // Blur radius
                                      offset: Offset(0, 3), // Offset of the shadow
                                    ),
                                  ],
                                ),
                                child: IconButton(icon: Image.asset('images/11244686.png', width: 90,height: 90,),
                                  onPressed: () {
                                    _pickImage(ImageSource.gallery);
                                  },
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
