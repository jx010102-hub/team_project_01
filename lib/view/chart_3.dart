import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:team_project_01/model/developer_data.dart';

class Chart3 extends StatefulWidget {
  const Chart3({super.key});

  @override
  State<Chart3> createState() => _Chart3State();
}

class _Chart3State extends State<Chart3> {
  //Property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    addData();
  }

  addData() {
    data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 35000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bar Chart')),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 550,
          child: SfCircularChart(
            title: ChartTitle(
              text:
                  'Yearly Growth in the Flutter Coummunity',
            ),
            tooltipBehavior:
                tooltipBehavior, // 눌렀을때 수치 뜨게 하는 법
            series: <CircularSeries<DeveloperData, int>>[
              PieSeries<DeveloperData, int>(
                name: 'Site',
                dataSource: data,
                explode: true, // 한조각만 띄어내는거
                selectionBehavior: SelectionBehavior(
                  enable: true,
                ), // 한조각만 눌러보는 거
                xValueMapper:
                    (DeveloperData developers, _) =>
                        developers.year,
                yValueMapper:
                    (DeveloperData developers, _) =>
                        developers.developers,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                ),
                enableTooltip: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
