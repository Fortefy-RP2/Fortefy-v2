import 'package:flutter/material.dart';

class PriceSlider extends StatefulWidget {
  @override
  _PriceSliderState createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  double _selectedPrice = 500;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecione o valor máximo desejado:',
          style: TextStyle(fontSize: 16),
        ),
        Slider(
          value: _selectedPrice,
          min: 0,
          max: 1000,
          divisions: 20,
          label: 'R\$${_selectedPrice.toStringAsFixed(0)}',
          onChanged: (value) {
            setState(() {
              _selectedPrice = value;
            });
          },
        ),
        Text(
          'R\$${_selectedPrice.toStringAsFixed(0)}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
