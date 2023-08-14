import 'package:flutter/material.dart';
import 'package:rajneeshloginvalidation/widgetFile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Text("Home Screen",style: WidgetFile.textStyle(40, Colors.green, FontWeight.w600),),
      ),
    );
  }
}
