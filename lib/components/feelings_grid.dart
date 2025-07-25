import 'package:calmi_app/models/moods_reason_model.dart';
import 'package:calmi_app/repositories/feelings_repo.dart';
import 'package:calmi_app/repositories/moods_reason_repo.dart';
import 'package:flutter/material.dart';

class FeelingsGrid extends StatefulWidget {
  const FeelingsGrid({super.key});

  @override
  State<FeelingsGrid> createState() => _FeelingsGridState();
}

class _FeelingsGridState extends State<FeelingsGrid> {
  final Set<int> selectedFeelingsIndexes = {};

  void toggleReason(int index){
    setState(() {
      if(selectedFeelingsIndexes.contains(index)){
        selectedFeelingsIndexes.remove(index);
      } else {
        selectedFeelingsIndexes.add(index);
      }
    });
  }

  List<MoodsReasonModel> get selectedFeelings => selectedFeelingsIndexes.map((index) => moodsReasonsList[index]).toList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feelingList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final item = moodsReasonsList[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          height: 300,
          width: 300,
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Image.asset(item.image, height: 35, width: 35),
            const Spacer(),
            Text(
              item.reason,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize, fontWeight: FontWeight.w500),
            ),
          ],),
        );
      },
    );
  }
}