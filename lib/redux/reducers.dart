import 'package:flutter_redux_tutorial/redux/app_state.dart';

import 'actions.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is AddAction) {
    return AppState(counter: state.counter + 1, text: state.text);
  } else if (action is SetTextAction) {
    return AppState(counter: state.counter, text: action.text);
  } else {
    return state;
  }
}
