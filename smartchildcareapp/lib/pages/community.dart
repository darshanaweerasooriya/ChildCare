import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List<Map<String, dynamic>> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:3000/postderail'));
      if (response.statusCode == 200) {
        setState(() {
          posts = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error fetching posts: $e');
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
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        "Let’s Share health tips and Updates",
                        style: TextStyle(fontSize: 20, color: Colors.blue.shade900),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        "with others",
                        style: TextStyle(fontSize: 20, color: Colors.blue.shade900),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index]['title'],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              posts[index]['description'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
