import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_tutorial/redux/app_state.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';
import 'redux/reducers.dart';

void main() {
  final Store<AppState> store = Store(reducer,
      initialState:
          AppState(counter: 0, text: "init", widget: Icon(Icons.image)));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.all(16),
                child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (context, vm) => vm.widget,
                )),
            ElevatedButton(onPressed: () => store.dispatch(loadImageThunkAction(store)), child: Text("Get image")),
            Container(
              width: 200,
              child: TextField(
                onChanged: (value) => inputText = value,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => store.dispatch(SetTextAction(text: inputText)), child: Text("SET")),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: () => store.dispatch(ResetTextAction()), child: Text("RESET")),
              ],
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => store.dispatch(calcCountThunkAction(store)),
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20,),
                FloatingActionButton(
                  onPressed: () => store.dispatch(RemoveAction()),
                  child: Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
