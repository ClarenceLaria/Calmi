import 'package:calmi_app/models/moods_reason_model.dart';
import 'package:calmi_app/repositories/moods_reason_repo.dart';
import 'package:flutter/material.dart';

class MoodsReasonGrid extends StatefulWidget {
  const MoodsReasonGrid({super.key});

  @override
  State<MoodsReasonGrid> createState() => _MoodsReasonGridState();
}

class _MoodsReasonGridState extends State<MoodsReasonGrid> {
  final Set<int> selectedReasonsIndexes = {};

  void toggleReason(int index){
    setState(() {
      if(selectedReasonsIndexes.contains(index)){
        selectedReasonsIndexes.remove(index);
      } else {
        selectedReasonsIndexes.add(index);
      }
    });
  }

  List<MoodsReasonModel> get selectedReasons => selectedReasonsIndexes.map((index) => moodsReasonsList[index]).toList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: moodsReasonsList.length,
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
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          height: 250,
          width: 250,
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Image.asset(item.image, height: 40, width: 40),
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