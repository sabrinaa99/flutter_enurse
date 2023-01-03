import 'package:flutter/material.dart';
import 'package:flutter_php/users/fragments/nav_drawer.dart';


class DashboardOfFragments extends StatelessWidget {
  const DashboardOfFragments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Stack(
        children: <Widget>[
          Container(color: selectedColor,),
          CollapsingNavigationDrawer()
        ],
      )
    );
  }
}
