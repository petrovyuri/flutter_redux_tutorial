import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_tutorial/redux/app_state.dart';
import 'package:redux/redux.dart';

import 'actions.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    widget: _imageReducer(state.widget, action),
    counter: _counterReducer(state.counter, action),
    text: _textReducer(state.text, action));

Reducer<Widget> _imageReducer = combineReducers(
    [TypedReducer(_getImageReducer), TypedReducer(_loadedImageReducer)]);

Widget _getImageReducer(Widget widget, GetImageAction action) =>
    Center(child: CircularProgressIndicator());

Widget _loadedImageReducer(Widget widget, LoadedImageAction action) =>
    action.widget;

Reducer<String> _textReducer = combineReducers([
  TypedReducer<String, SetTextAction>(_setTextReducer),
  TypedReducer<String, ResetTextAction>(_resetTextReducer),
]);

Reducer<int> _counterReducer = combineReducers([
  TypedReducer<int, AddAction>(_addCounterReducer),
  TypedReducer<int, RemoveAction>(_removeCounterReducer),
]);

int _addCounterReducer(int count, AddAction action) {
  int count = 0;
  for (var i = 0; i < 5000000000; ++i) {
    count++;
  }
  return count;
}

int _removeCounterReducer(int count, RemoveAction action) => count - 1;

String _setTextReducer(String text, SetTextAction action) => action.text;

String _resetTextReducer(String text, ResetTextAction action) => "";

// AppState reducer(AppState state, dynamic action) =>
//     AppState(counter: _counterReducer(state, action), text: _textReducer(state, action));
//
// int _counterReducer(AppState state, dynamic action) {
//   if (action is AddAction) {
//     return state.counter + 1;
//   } else if (action is RemoveAction) {
//     return state.counter - 1;
//   } else
//     return state.counter;
// }
//
// String _textReducer(AppState state, dynamic action) {
//   if (action is SetTextAction) {
//     return action.text;
//   } else if (action is ResetTextAction) {
//     return "";
//   } else {
//     return state.text;
//   }
// }
