import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/data_provider.dart';
import '../models/data_model.dart';

class ProductionChart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsyncValue = ref.watch(dataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Natural Rubber Production'),
      ),
      body: dataAsyncValue.when(
        data: (data) {
          final seriesList = [
            charts.Series<DataModel, String>(
              id: 'Kerala',
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
              domainFn: (DataModel datum, _) => datum.year,
              measureFn: (DataModel datum, _) => datum.kerala,
              data: data,
            ),
            charts.Series<DataModel, String>(
              id: 'Tamil Nadu',
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
              domainFn: (DataModel datum, _) => datum.year,
              measureFn: (DataModel datum, _) => datum.tamilNadu,
              data: data,
            ),
            charts.Series<DataModel, String>(
              id: 'Tripura',
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.green),
              domainFn: (DataModel datum, _) => datum.year,
              measureFn: (DataModel datum, _) => datum.tripura,
              data: data,
            ),
            charts.Series<DataModel, String>(
              id: 'Assam',
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.orange),
              domainFn: (DataModel datum, _) => datum.year,
              measureFn: (DataModel datum, _) => datum.assam,
              data: data,
            ),
            charts.Series<DataModel, String>(
              id: 'Meghalaya',
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.purple),
              domainFn: (DataModel datum, _) => datum.year,
              measureFn: (DataModel datum, _) => datum.meghalaya,
              data: data,
            ),
            charts.Series<DataModel, String>(
              id: 'Karnataka',
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.brown),
              domainFn: (DataModel datum, _) => datum.year,
              measureFn: (DataModel datum, _) => datum.karnataka,
              data: data,
            ),
            charts.Series<DataModel, String>(
              id: 'Other States',
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.grey),
              domainFn: (DataModel datum, _) => datum.year,
              measureFn: (DataModel datum, _) => datum.otherStates,
              data: data,
            ),
          ];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: charts.BarChart(
                    seriesList,
                    animate: true,
                    primaryMeasureAxis: charts.NumericAxisSpec(
                      tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
                            (value) => value.toString(),
                      ),
                    ),
                    domainAxis: charts.OrdinalAxisSpec(
                      renderSpec: charts.GridlineRendererSpec(
                        labelStyle: charts.TextStyleSpec(fontSize: 12, color: charts.MaterialPalette.black),
                        lineStyle: charts.LineStyleSpec(color: charts.MaterialPalette.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Legend:', style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 8),
                Row(
                  children: [
                    _buildColorBox(Colors.blue, 'Kerala'),
                    SizedBox(width: 8),
                    _buildColorBox(Colors.red, 'Tamil Nadu'),
                    SizedBox(width: 8),
                    _buildColorBox(Colors.green, 'Tripura'),
                    SizedBox(width: 8),
                    _buildColorBox(Colors.orange, 'Assam'),
                    SizedBox(width: 8),
                    _buildColorBox(Colors.purple, 'Meghalaya'),
                    SizedBox(width: 8),
                    _buildColorBox(Colors.brown, 'Karnataka'),
                    SizedBox(width: 8),
                    _buildColorBox(Colors.grey, 'Other States'),
                  ],
                ),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Failed to load data: $error')),
      ),
    );
  }

  Widget _buildColorBox(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
