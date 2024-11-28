import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? _selectedGender = 'Masculino';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecione o sexo:',
          style: TextStyle(fontSize: 16),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: Text('M'),
                value: 'Masculino',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text('F'),
                value: 'Feminino',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text('O'),
                value: 'Outros',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
