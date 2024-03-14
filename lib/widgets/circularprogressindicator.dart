import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class CircularProgressIndicatorBar extends StatelessWidget {
  double bmi = 0.0;

  CircularProgressIndicatorBar(double i, {super.key}) {
    this.bmi = i;
  }
  @override
  Widget build(BuildContext context) {
    final InnerRadiues = MediaQuery.of(context).size.width * 0.4;
    final OuterRadiues = MediaQuery.of(context).size.width * 0.6;
    return Container(
      height: OuterRadiues,
      width: OuterRadiues,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(4, 4)),
            const BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(-4, -4))
          ]),
      child: Center(
        child: Stack(
          children: [
            Center(
                child: Container(
                    height: InnerRadiues,
                    width: InnerRadiues,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(160),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(4, 4),
                            inset: true,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(-4, -4),
                            inset: true,
                          )
                        ]))),
            Center(
              child: CircularPercentIndicator(
                radius: 118,
                lineWidth: 30,
                backgroundColor: Colors.white,
                progressColor: Colors.lightGreen,
                percent: (bmi / 10) % 2,
                center: Text(bmi.toString()),
                circularStrokeCap: CircularStrokeCap.butt,
                animation: true,
                animationDuration: 2000,
                onAnimationEnd: () => print("Animation finished!"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
