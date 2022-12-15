import 'dart:convert';

import 'package:api_test/widgets/single_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> repos = [];

  @override
  void initState() {
    fetchRepo();
    super.initState();
  }

  void fetchRepo() async {
    print('fetchRepo called');
    final url =
        'https://api.github.com/search/repositories?q=created:>2022-09-29&sort=stars&order=desc';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    repos = json['items'];
    setState(() {
      repos = json['items'];
    });
    print('fetching repos completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5fffa),
      appBar: AppBar(
        backgroundColor: Color(0xfff5fffa),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Rest api call',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (context, index) {
          final repo = repos[index];
          final name = repo['name'];
          final description = repo['description'];
          final avatar = repo['owner']['avatar_url'];
          final userName = repo['owner']['login'];
          final rating = repo['stargazers_count'];
          return Column(
            children: [
              SingleCard(
                image: avatar,
                title: name,
                description: description,
                categoryName: userName,
                ratingStarCount: 4,
                ratingCount: rating.toString(),
              ),
              Gap(10),
            ],
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchRepo,
      // ),
    );
  }
}
