import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  final int count;
  final String label;

  AppState({required this.count, required this.label});
}
