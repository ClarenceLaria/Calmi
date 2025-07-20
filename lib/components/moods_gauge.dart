import 'package:calmi_app/models/mood_model.dart';
import 'package:calmi_app/repositories/moods_repo.dart';
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
    return GestureDetector(
      onTapDown: (details) {
        RenderBox box = context.findRenderObject() as RenderBox;
        final Offset localOffset = box.globalToLocal(details.globalPosition);

        final double width = box.size.width;
        final double height = box.size.height;
        final Offset center = Offset(width / 2, height); // bottom center for semicircle

        final Offset relative = localOffset - center;
        final double angle = relative.direction * (180 / 3.141592); // in degrees

        // Convert angle to value (0-100 range)
        if (angle >= -180 && angle <= 0) {
          final double gaugeValue = ((angle + 180) / 180) * 100;
          _handleGaugeTap(gaugeValue);
        }
      },
      child: Container(
        height: 300,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
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
                    label: moods[index].label,
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
      ),
    );
  }
}
