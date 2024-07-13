import 'dart:convert';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class scan extends StatefulWidget {
  const scan({Key? key}) : super(key: key);

  @override
  State<scan> createState() => _scanState();
}

class _scanState extends State<scan> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  String? _prediction;



  Future<void> _pickImage(ImageSource source) async {
    final pickedfile = await _picker.getImage(source: source);
    if (pickedfile != null){
      setState(() {
        _imageFile = File(pickedfile.path);
        _prediction = null ;
      });

      await fetchprediction();
    } else {
      setState(() {
        _prediction = "Cannot recognize";
      });
    }
  }
  Future<void> savePrection(String disease) async{
    final url = Uri.parse('http://10.0.2.2:3000/predictions');
    final response = await http.post(
        url,
        body: {'disease': disease}
    );
    if (response.statusCode == 201){
      print("success");
    }else{
      print("Failed");
    }
  }
  
  Future<void> fetchprediction() async{
    if (_imageFile == null) {
      setState(() {
        _prediction = "Cannot recognize";
      });
      return;
    }
    final url = Uri.parse('http://localhost:8000/predict');
    final request = http.MultipartRequest('POSt', url)
      ..files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));
    print('Sending request: $request');
    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200){
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {

        _prediction = data['prediction'];
      });
    } else {
      setState(() {
        _prediction = "Cannot recognize";
      });
      print('Failed to load prediction: ${response.statusCode}');
      throw Exception('Failed to load prediction');
    }
  }
  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width * 0.8;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/healthcare.jpg'),
          fit: BoxFit.cover,
        ),
      ),
        child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.9, sigmaY:0.9),
    child: Container(
    color: Colors.black.withOpacity(0.2),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(

            child: Column(

              children: [
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: containerSize,
                      height: containerSize,
                      color: Colors.white,
                      child:
                        _imageFile !=null
                            ? Image.file(_imageFile!,fit: BoxFit.cover,): Center(child: Text("No Image Selected"),)

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _prediction != null
                        ? Text(
                      _prediction!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        : Container(),
                  ],
                ),
                SizedBox(height: 100,width: 60,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 80,),
                    Column(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                            width: 80,
                            height: 80,
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
                            child: IconButton(icon: Image.asset('images/Camera.png', width: 90,height: 90,),
                              onPressed: () {
                              _pickImage(ImageSource.camera);
                              },
                            )
                        )
                      ],
                    ),
                    SizedBox(width: 95,),
                    Column(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                          width: 80,
                          height: 80,
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
                          )

                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 5),
                    Container(
                      width: 320,
                      height: 50,
                      child:
                      ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue.shade900),
                        ),
                        child: const Text("Chanel a Doctor", style: TextStyle(fontSize: 20,color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 5),
                    Container(
                      width: 320,
                      height: 50,
                      child:
                      ElevatedButton(
                        onPressed: _prediction != null ? (){
                          if(_prediction != null){
                            savePrection(_prediction!);
                          }
                        }: null,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red),
                        ),
                        child: const Text("Save", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    )));
  }
}