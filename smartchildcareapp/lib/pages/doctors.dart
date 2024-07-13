import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List<Map<String, dynamic>> doctorsDetails = [];

  Future<void> fetchDoctorDetails(String location) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/doctordetail'));

    if (response.statusCode == 200) {
      setState(() {
        doctorsDetails = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load doctor details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text("E-chanelling Center", style: TextStyle(fontSize: 25)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Location',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (location) {
                        fetchDoctorDetails(location);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: doctorsDetails.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(doctorsDetails[index]["name"]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(doctorsDetails[index]["hospital"]),
                            Text(doctorsDetails[index]["location"]),
                            Text(doctorsDetails[index]["time"]),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



