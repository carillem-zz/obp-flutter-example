import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        behaviors: [
          new charts.DatumLegend(
            position: charts.BehaviorPosition.end,
            horizontalFirst: false,
            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
            showMeasures: true,
            legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          )
        ],
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60));
  }
}
