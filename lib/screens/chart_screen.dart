import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../models/data_model.dart';
import '../widgets/chart_widget.dart';



class ChartWidget extends StatelessWidget {
  final List<DataModel> data;

  ChartWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    final seriesList = [
      charts.Series<DataModel, String>(
        id: 'Kerala',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
        domainFn: (DataModel datum, _) => datum.year,
        measureFn: (DataModel datum, _) => datum.kerala,
        data: data,
      ),
      // Add other series definitions here
    ];

    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }
}
