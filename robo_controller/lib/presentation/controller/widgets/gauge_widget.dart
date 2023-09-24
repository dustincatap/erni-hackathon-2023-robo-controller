import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeWidget extends StatefulWidget {
  const GaugeWidget({required this.value, super.key});
  final double value;

  @override
  State<GaugeWidget> createState() => _GaugeWidgetState();
}

class _GaugeWidgetState extends State<GaugeWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16),
        child: SizedBox(
          width: 100,
          height: 100,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 200,
                labelOffset: 30,
                showLabels: false,
                axisLineStyle: const AxisLineStyle(thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                majorTickStyle: const MajorTickStyle(length: 6, thickness: 4, color: Colors.white),
                minorTickStyle: const MinorTickStyle(length: 3, thickness: 3, color: Colors.white),
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 200,
                    sizeUnit: GaugeSizeUnit.factor,
                    startWidth: 0.03,
                    endWidth: 0.1,
                    gradient: const SweepGradient(
                      colors: <Color>[Colors.green, Colors.yellow, Colors.red],
                      stops: <double>[0.0, 0.5, 1],
                    ),
                  )
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                      value: widget.value,
                      needleLength: 0.95,
                      enableAnimation: true,
                      animationType: AnimationType.ease,
                      needleStartWidth: 1.5,
                      needleEndWidth: 6,
                      needleColor: Colors.red,
                      knobStyle: const KnobStyle(knobRadius: 0.09))
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    verticalAlignment: GaugeAlignment.near,
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '${widget.value.toStringAsFixed(2)}\nmph',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    angle: 90,
                    positionFactor: 0.6,
                  ),
                ],
              ),
              RadialAxis(
                startAngle: 270,
                endAngle: 270,
                minimum: 0,
                maximum: 80,
                interval: 10,
                radiusFactor: 0.3,
                onLabelCreated: labelCreated,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void labelCreated(AxisLabelCreatedArgs args) {
    if (args.text == '0') {
      args.text = 'N';
      args.labelStyle = const GaugeTextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 10);
    } else if (args.text == '10') {
      args.text = '';
    } else if (args.text == '20') {
      args.text = 'E';
      args.labelStyle = const GaugeTextStyle(fontSize: 10);
    } else if (args.text == '30') {
      args.text = '';
    } else if (args.text == '40') {
      args.text = 'S';
      args.labelStyle = const GaugeTextStyle(fontSize: 10);
    } else if (args.text == '50') {
      args.text = '';
    } else if (args.text == '60') {
      args.text = 'W';
      args.labelStyle = const GaugeTextStyle(fontSize: 10);
    } else if (args.text == '70') {
      args.text = '';
    }
  }
}
