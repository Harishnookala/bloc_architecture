import 'package:flutter/material.dart';

class MyButtonGroup extends StatefulWidget {
  const MyButtonGroup({Key? key}) : super(key: key);

  @override
  MyButtonGroupState createState() => MyButtonGroupState();
}

class MyButtonGroupState extends State<MyButtonGroup> {
  // The index of the selected button, initially -1 (no button selected)
  int _selectedIndex = -1;

  // The list of button labels
  final List<String> _buttonLabels = ['A', 'B', 'C', 'D', 'E'];

  // The function that handles the button press
  void _onButtonPressed(int index) {
    // Update the state with the new selected index
    setState(() {
      _selectedIndex = index;
    });
  }

  // The function that returns a button widget with the given index and label
  Widget _buildButton(int index, String label) {
    // The color of the button, depending on whether it is selected or not
    Color buttonColor =
    index == _selectedIndex ? Colors.red : Colors.white;

    // The color of the text, depending on whether it is selected or not
    Color textColor =
    index == _selectedIndex ? Colors.white : Colors.black;

    // Return a TextButton widget with the given parameters
    return TextButton(
      onPressed: () => _onButtonPressed(index),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
      ),
      child: Text(
        label,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Return a Row widget that contains five buttons
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        _buttonLabels.length,
            (index) => _buildButton(index, _buttonLabels[index]),
      ),
    );
  }
}
