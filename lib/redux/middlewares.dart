import 'package:flutter/cupertino.dart';
import 'package:flutter_redux_tutorial/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

void loaderMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher nextDispatcher) {
  if (action is GetImageAction) {
    _loadImage("https://picsum.photos/200/300?grayscale")
        .then((image) => store.dispatch(LoadedImageAction(image)));
  }

 nextDispatcher(action);
}

Future<Widget> _loadImage(String url) async {
  await Future.delayed(Duration(seconds: 5));
  return Image.network(url);
}
