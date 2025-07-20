import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MoodsGauge extends StatelessWidget {
  const MoodsGauge({
    super.key,
    required this.mood,
  });

  final Map<String, dynamic> mood;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            interval: 20,
            startAngle: 180,
            endAngle: 0,
            radiusFactor: 0.8,  
            showTicks: false,
            axisLineStyle: AxisLineStyle(
              thickness: 0.2,
              color: Color.fromARGB(255, 29, 28, 28),
            ),
            ranges: [
              GaugeRange(
                startValue: 0,
                endValue: 20,
                color: mood['color'],
                startWidth: 0.2,
                endWidth: 0.2,
                label: mood['emoji'],
              ),
            ],
            pointers: <GaugePointer>[
              RangePointer(
                value: 50, 
                width: 0.2,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  'Mood Level',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                positionFactor: 0.1,
                angle: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}