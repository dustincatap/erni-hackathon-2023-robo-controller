import 'package:flutter/material.dart';

class TopViewCarWidget extends StatefulWidget {
  const TopViewCarWidget({required this.value, super.key});
  final double value;
  @override
  State<TopViewCarWidget> createState() => _TopViewCarWidgetState();
}

class _TopViewCarWidgetState extends State<TopViewCarWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Transform.rotate(
          angle: widget.value,
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Image(
              image: AssetImage(
                'assets/top-view-car.png',
              ),
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
