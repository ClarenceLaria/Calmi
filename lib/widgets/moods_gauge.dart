import 'package:calmi_app/core/models/mood_model.dart';
import 'package:calmi_app/core/repositories/moods_repo.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MoodsGauge extends StatefulWidget {
  final Function(MoodModel) onMoodSelected; // Pass selected mood to parent

  const MoodsGauge({
    super.key,
    required this.onMoodSelected,
  });

  @override
  State<MoodsGauge> createState() => _MoodsGaugeState();
}

class _MoodsGaugeState extends State<MoodsGauge> {
  double _value = 50; // Needle pointer default
  late final List<MoodModel> moods;
  late final double interval;

  @override
  void initState() {
    super.initState();
    moods = moodsList;
    interval = 100 / moods.length;

    // Initialize the gauge with a default value
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleGaugeTap(_value);
    });
  }

  void _handleGaugeTap(double tappedValue) {
    setState(() {
      _value = tappedValue;
    });

    int index = (_value ~/ interval).clamp(0, moods.length - 1);
    MoodModel selectedMood = moods[index];

    widget.onMoodSelected(selectedMood);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            interval: interval,
            startAngle: 180,
            endAngle: 0,
            radiusFactor: 0.8,
            showTicks: false,
            showLabels: false,
            canScaleToFit: true,
            onAxisTapped: (details) {
              final double tappedValue = details;
              _handleGaugeTap(tappedValue);
            },
            axisLineStyle: const AxisLineStyle(
              thickness: 0.2,
              color: Color.fromARGB(255, 29, 28, 28),
            ),
            ranges: List.generate(
              moods.length,
              (index) {
                final double start = index * interval;
                final double end = start + interval;
                return GaugeRange(
                  startValue: start,
                  endValue: end,
                  color: moods[index].color,
                  label: moods[index].emoji,
                );
              },
            ),
            pointers: <GaugePointer>[
              NeedlePointer(
                value: _value,
              ),
            ],
            annotations: const <GaugeAnnotation>[
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
