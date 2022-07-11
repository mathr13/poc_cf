import 'package:flutter/material.dart';

extension TappableWidget on Widget {
  Widget onTap(Function() onPressed) {
    return GestureDetector(
      child: this,
      onTap: onPressed,
    );
  }
}