import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.purple, width: 2.0),
  ),
);