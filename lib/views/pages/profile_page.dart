import 'package:flutter/material.dart';
import 'package:rollease/views/widgets/navigation_drawer_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('Profile'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
  );
}