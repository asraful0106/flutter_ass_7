import 'package:ass_3/core/widgets/action_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppActionBar(
        title: 'Contact List',
      ),
      body: Center(child: Text('Hello World', style: TextStyle(fontSize: 24))),
    );
  }
}
