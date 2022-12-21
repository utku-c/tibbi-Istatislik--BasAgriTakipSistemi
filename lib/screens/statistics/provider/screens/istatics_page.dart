import 'package:bas_agrisi_takip_sistemi/constants/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/istatik_model.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  List<IstatikModel> istatiklerlistesi = [
    IstatikModel(ay: 0, deger: 0),
    IstatikModel(ay: 1, deger: 10),
    IstatikModel(ay: 2, deger: 2),
    IstatikModel(ay: 3, deger: 3),
    IstatikModel(ay: 4, deger: 4),
    IstatikModel(ay: 5, deger: 2),
    IstatikModel(ay: 6, deger: 3),
  ];

  void startCreatingDemoData() async {
    for (int i = 0; i < 7; i++) {
      if (i == 0) continue;
      await Future.delayed((const Duration(milliseconds: 500)))
          .then((value) => {
                flSpots.add(
                  FlSpot(
                    double.parse(i.toString()),
                    istatiklerlistesi[i].deger.toDouble(),
                  ),
                ),
                setState(() {
                  setChartData();
                }),
              });
    }
  }

  @override
  void initState() {
    super.initState();
    setChartData();
    startCreatingDemoData();
  }

  LineChartData data = LineChartData();
  void setChartData() {
    data = LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: ((value) {
          return FlLine(
            strokeWidth: 1,
          );
        }),
        getDrawingVerticalLine: ((value) {
          return FlLine(
            strokeWidth: 1,
            dashArray: [2, 2, 2],
          );
        }),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 1,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 1:
                  return Transform.rotate(
                    angle: 1.3,
                    child: const Text("Ocak-Şubat"),
                  );
                case 2:
                  return Transform.rotate(
                    angle: 1.3,
                    child: const Text("Mart-Nisan"),
                  );
                case 3:
                  return Transform.rotate(
                    angle: 1.3,
                    child: const Text("Mayıs-Haziran"),
                  );
                case 4:
                  return Transform.rotate(
                    angle: 1.3,
                    child: const Text("Temmuz-Ağustos"),
                  );
                case 5:
                  return Transform.rotate(
                    angle: 1.3,
                    child: const Text("Eylül-Ekim"),
                  );
                case 6:
                  return Transform.rotate(
                    angle: 1.3,
                    child: const Text("Kasım-Aralık"),
                  );
              }
              return const SizedBox();
            },
            showTitles: true,
            reservedSize: 16,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: kMyPrimaryColor,
          width: 2,
        ),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: flSpots,
          isCurved: true,
          color: kMyPrimaryColor,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: kMyPrimaryTextColor.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  List<FlSpot> flSpots = [
    const FlSpot(0, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("istatikler"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: AspectRatio(
            aspectRatio: 1.2,
            child: LineChart(data),
          ),
        ),
      ),
    );
  }
}
