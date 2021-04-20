import 'package:flutter_redux_tutorial/redux/app_state.dart';
import 'package:redux/redux.dart';

import 'actions.dart';

/// Комбинирование с помощью combineReducer + TypedReducer
AppState reducer(AppState state, dynamic action) => AppState(
    count: countReducer(state.count, action),
    label: labelReducer(state.label, action));

Reducer<int> countReducer = combineReducers([
  TypedReducer<int, AddAction>(addCountReducer),
  TypedReducer<int, RemoveAction>(removeCountReducer),
]);

Reducer<String> labelReducer = combineReducers([
  TypedReducer<String, SetTextAction>(setLabelReducer),
  TypedReducer<String, ResetTextAction>(resetLabelReducer),
]);

int addCountReducer(int count, AddAction action) => count + 1;

int removeCountReducer(int count, RemoveAction action) => count - 1;

String setLabelReducer(String label, SetTextAction action) => "SET";

String resetLabelReducer(String label, ResetTextAction action) => "RESET";

/// Простое комбинирование
/*
AppState reducer(AppState state, dynamic action) => AppState(
    count: countReducer(state, action), label: labelReducer(state, action));

int countReducer(AppState state, dynamic action) {
  if (action is AddAction) {
    return state.count + 1;
  } else if (action is RemoveAction) {
    return state.count - 1;
  } else
    return state.count;
}

String labelReducer(AppState state, dynamic action) {
  if (action is SetTextAction) {
    return "SET";
  } else if (action is ResetTextAction) {
    return "RESET";
  } else
    return state.label;
}*/
