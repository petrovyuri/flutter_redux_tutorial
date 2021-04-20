import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_tutorial/redux/actions.dart';
import 'package:flutter_redux_tutorial/redux/app_state.dart';
import 'package:flutter_redux_tutorial/redux/reducers.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<AppState> store = Store(reducer, initialState: AppState(count: 0,label: "Init"));
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Redux"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => store.dispatch(SetTextAction()), child: Text("Set")),
                SizedBox(width: 20),
                StoreConnector<AppState,AppState>(
                    converter: (store) => store.state,
                    builder: (context, state) => Text(state.label)),
                SizedBox(width: 20),
                ElevatedButton(onPressed: () => store.dispatch(ResetTextAction()), child: Text("Reset")),
              ],
            ),

            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                state.count.toString(),
                style: TextStyle(fontSize: 35),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    onPressed: () => store.dispatch(AddAction()),
                    child: Icon(Icons.add)),
                SizedBox(width: 20),
                FloatingActionButton(
                    onPressed: () => store.dispatch(RemoveAction()),
                    child: Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }
}



