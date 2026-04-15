import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiFetcher(),
    );
  }
}

class ApiFetcher extends StatefulWidget {
  const ApiFetcher({super.key});

  @override
  State<ApiFetcher> createState() => _ApiFetcherState();
}

class _ApiFetcherState extends State<ApiFetcher> {
  Map<String, dynamic>? data;
  bool isLoading = false;
  String? error;

  Future<void> fetchUser() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final response =
          await http.get(Uri.parse('https://randomuser.me/api/'));

      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
        });
      } else {
        setState(() {
          error = "Failed to load user";
        });
      }
    } catch (e) {
      setState(() {
        error = "Error: $e";
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUser(); // fetch on start
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random User"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : error != null
                ? Text(error!)
                : data == null
                    ? const Text("No Data")
                    : buildUserCard(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget buildUserCard() {
    final user = data!['results'][0];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user['picture']['large']),
              ),
              const SizedBox(height: 15),
              Text(
                "${user['name']['first']} ${user['name']['last']}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(user['email']),
              const SizedBox(height: 10),
              Text("${user['location']['country']}"),
            ],
          ),
        ),
      ),
    );
  }
}