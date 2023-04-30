import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  Timer timer = Timer(const Duration(seconds: 1), () {});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Count"),
        actions: [
          const Icon(Icons.abc),
          IconButton(
              onPressed: () {
                log("Onpress Clicked");
              },
              icon: const Icon(Icons.add_a_photo)),
        ],
      ),
      body: Center(
        child: Text("Counter $counter"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              timer.cancel();
              // counter = 0;
              setState(() {});
            },
            backgroundColor: Colors.amber,
            elevation: 10,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                setState(() {
                  counter = counter + 1;
                });
              });
              log(counter.toString());
            },
            backgroundColor: Colors.amber,
            elevation: 10,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
