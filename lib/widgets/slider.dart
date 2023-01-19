import 'package:flutter/material.dart';

class SliderBar extends StatefulWidget {
  final value;

  const SliderBar({Key? key, required this.value}) : super(key: key);

  @override
  State<SliderBar> createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  var _value = 20.0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 65.0,
        trackShape: RoundedRectSliderTrackShape(),
        activeTrackColor: Theme.of(context).iconTheme.color,
        inactiveTrackColor: Theme.of(context).cardColor,
        thumbColor: Colors.transparent,
        overlayColor: Colors.transparent,
      ),
      child: Slider(
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }
}
