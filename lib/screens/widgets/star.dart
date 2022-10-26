import 'package:flutter/material.dart';

class StarDisplayWidget extends StatelessWidget {
  final double value;
  final Widget filledStar;
  final Widget unfilledStar;
  StarDisplayWidget({
    Key? key,
    this.value = 0,
    required this.filledStar,
    required this.unfilledStar,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return index < value ? filledStar : unfilledStar;
      }),
    );
  }
}
