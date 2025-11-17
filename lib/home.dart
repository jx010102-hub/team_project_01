import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:team_project_01/view/chart_1.dart';
import 'package:team_project_01/view/chart_2.dart';
import 'package:team_project_01/view/chart_3.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart App'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: TabBarView(
        controller: controller,
        children: [Chart1(), Chart2(), Chart3()],
      ),
      bottomNavigationBar: Container(
        color: Colors.white, //바컨테이너의 색깔
        height: 80, //바높이
        child: TabBar(
          controller: controller, //탭바뷰와 공유
          labelColor: Colors.blue,
          indicatorColor: Colors.blue, //밑에인디케이터색깔
          indicatorWeight: 5,
          tabs: [
            Tab(
              icon: Icon(Icons.bar_chart_rounded),
              text: "Pie",
            ),
            Tab(
              icon: Icon(Icons.line_axis_rounded),
              text: "Bar",
            ),
            Tab(
              icon: Icon(Icons.scatter_plot_rounded),
              text: "Scatter",
            ),
          ],
        ),
      ),
    );
  }
}
