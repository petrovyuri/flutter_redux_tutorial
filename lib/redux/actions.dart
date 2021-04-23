import 'package:flutter/cupertino.dart';

class AddAction {}

class RemoveAction {}

class SetTextAction {
  final String text;

  SetTextAction({required this.text});
}

class ResetTextAction {}

class GetImageAction {}

class LoadedImageAction {
  final Widget widget;

  LoadedImageAction(this.widget);
}
