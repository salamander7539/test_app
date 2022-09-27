import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bool result;

  const ResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const path = 'assets/images';
    return Scaffold(
      appBar: AppBar(
        title: Text(
            result ? 'Access' : 'Denied'
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Center(child: Image.asset(result ? '$path/access.png' : '$path/denied.png')),
      ),
    );
  }
}
