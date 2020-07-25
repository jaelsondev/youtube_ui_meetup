import 'package:flutter/material.dart';
import 'package:youtube_ui_meetup/ui/pages/signin.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SiginPage());
  }
}