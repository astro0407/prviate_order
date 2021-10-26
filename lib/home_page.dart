import 'package:flutter/material.dart';

import 'insta_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff8faf8),
        centerTitle: true,
        elevation: 1.0,
        leading: Icon(Icons.camera_alt),
        title: SizedBox(height: 35.0, child: Image.asset("assets/images/insta_logo.png")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.send),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Expanded(flex: 1, child:  InstaStories()),
          Flexible(child: InstaList())
        ],
      ),
    );
  }
}
