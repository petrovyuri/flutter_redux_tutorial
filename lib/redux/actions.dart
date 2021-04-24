import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AddAction {
  final int count;

  AddAction(this.count);
}

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

ThunkAction calcCountThunkAction = (Store store) async {
  compute(calc, 900000000).then((value) => store.dispatch(AddAction(value)));
};


Future<int> calc(int count) async {
  int result = 0;
  for (var i = 0; i < count; ++i) {
    result++;
  }
  return result;
}


ThunkAction loadImageThunkAction = (Store store) async {
  store.dispatch(GetImageAction());
  _loadImage("https://picsum.photos/200/300?grayscale")
      .then((image) => store.dispatch(LoadedImageAction(image)));
};

Future<Widget> _loadImage(String url) async {
  await Future.delayed(Duration(seconds: 5));
  return Image.network(url);
}


