import 'package:cash_flow_app/const/app_colors.dart';
import 'package:flutter/material.dart';

final bold =
    TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600);
final discription =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: opacity);
final primarytxt =
    TextStyle(fontSize: 14, color: primary, fontWeight: FontWeight.w500);

// for buttons

final btnstyle =
    BoxDecoration(color: primary, borderRadius: BorderRadius.circular(16));

final textfieldstyle = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  hintStyle: discription.copyWith(color: Color(0xffFAFAFA).withOpacity(0.14)),
  fillColor: grey,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide.none,
  ),
);
