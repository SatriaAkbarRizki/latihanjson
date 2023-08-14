import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihanjson/model/usermodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel? userModel;

  Future<UserModel?> getDataUser() async {
    Uri url = Uri.parse('https://reqres.in/api/users/4');
    var response = await http.get(url);

    if (response.statusCode != 200) {
      return null;
    } else {
      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>);
      return userModel = UserModel.fromJson(data);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Belajar JSON Serializable'),
        ),
        body: FutureBuilder<UserModel?>(
          future: getDataUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            NetworkImage(snapshot.data!.data.avatar),
                      ),
                      Text("id : ${snapshot.data!.data.id}"),
                      Text("email : ${snapshot.data!.data.email}"),
                      Text("first_name : ${snapshot.data!.data.first_name}"),
                      Text("last_name : ${snapshot.data!.data.last_name}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("id : ${snapshot.data!.support.text}"),
                      Text("id : ${snapshot.data!.support.url}"),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text('TIDAK ADA DATA'),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
