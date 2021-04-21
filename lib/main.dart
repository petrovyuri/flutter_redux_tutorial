import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_tutorial/redux/app_state.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';
import 'redux/reducers.dart';

void main() {
  final Store<AppState> store = Store(reducer, initialState: AppState(counter: 0, text: "init"));
  runApp(StoreProvider(
    store: store,
    child: MaterialApp(
      home: _Counter(),
    ),
  ));
}

class _Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    String inputText = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Redux"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.dispatch(AddAction()),
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: TextField(
                onChanged: (value) => inputText = value,
              ),
            ),
            SizedBox(height: 20),
            TextButton(onPressed: () => store.dispatch(SetTextAction(text: inputText)), child: Text("SET")),
            StoreConnector<AppState, AppState>(
                converter: (store) => store.state, builder: (context, vm) => Text(vm.text)),
            SizedBox(height: 20),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                state.counter.toString(),
                style: TextStyle(fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
