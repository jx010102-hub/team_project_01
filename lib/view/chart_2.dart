import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:team_project_01/model/developer_data.dart';

class Chart2 extends StatefulWidget {
  const Chart2({super.key});

  @override
  State<Chart2> createState() => _HomeState();
}

class _HomeState extends State<Chart2> {
  //property
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
    //
    data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 35000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart 상현'),
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
              text:
                  'Yearly Growth in the Flutter Community\n\n',
            ),
            tooltipBehavior: tooltipBehavior,
            series: [
              // ColumnSeries : 세로축 막대그래프
              // BarSeries : 가로축 막대그래프
              ColumnSeries<DeveloperData, int>(
                name: '사이트 수',
                dataSource: data,
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
