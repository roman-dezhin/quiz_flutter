import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/questions');
          },
          child: const Text('Start'),
        ),
      ),
    );
  }
}
