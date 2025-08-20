import 'package:flutter/material.dart';

void main() {
  // runApp(MyApp());
  runApp(TodoExampleApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: Center(child: Counter()),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;
  // ignore: unused_field, prefer_final_fields
  String _name = '';

  void _incrementCounter() => setState(() {
    _count++;
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        ElevatedButton(onPressed: _incrementCounter, child: Text('+')),
      ],
    );
  }
}

class TodoExampleApp extends StatelessWidget {
  const TodoExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _TodoApp());
  }
}

class _TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<_TodoApp> {
  // ignore: prefer_final_fields
  List<String> _todos = [];
  final _controller = TextEditingController();

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Add a todo'),
                  ),
                ),
                ElevatedButton(onPressed: _addTodo, child: Text('Add')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_todos[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Flutter LifeCycle Methods
// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   void initState() {
//     super.initState();
//     // Like componentDidMount in React
//     fetchData();
//   }

//   @override
//   void dispose() {
//     // Like componentWillUnmount in React
//     cleanup();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(/*your UI*/);
//   }
// }
