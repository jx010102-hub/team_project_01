import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:team_project_01/model/developer_data.dart';

class Bar extends StatefulWidget {
  
  final List<DeveloperData> data;

  const Bar({super.key, required this.data});

  @override
  State<Bar> createState() => _HomeState();
}

class _HomeState extends State<Bar> {

  // Property
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCartesianChart(
            title: ChartTitle(
              text: 'Yearly Growth in the Flutter Community\n\n'
            ),
            tooltipBehavior: tooltipBehavior,
            series: [
              // ColumnSeries : 세로축 막대그래프
              // BarSeries : 가로축 막대그래프
              ColumnSeries<DeveloperData, int>(
                name: '사이트 수',
                dataSource: widget.data,
                xValueMapper: (DeveloperData developers, _) => developers.year,
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              ),
            ],
            // X축을 category로 표현
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: '년도'),
            ),
            // Y축을 숫자로 표현
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: '사이트 수'),
            ),
          ),
        ),
      ),
    );
  } // build
} // class