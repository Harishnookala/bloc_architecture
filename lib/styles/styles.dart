import 'package:flutter/material.dart';

var textFieldDecoration = InputDecoration(
    fillColor: Colors.pink,

    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.greenAccent, width: 1.9),
      borderRadius: BorderRadius.circular(10.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black45, width: 1.2),
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    border: const OutlineInputBorder());
