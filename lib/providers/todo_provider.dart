import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/models/todo.dart';





final todoProvider = StateNotifierProvider<TodoProvider, List<Todo>>((ref) => TodoProvider([
  Todo(title: 'reading some books', dateTime: DateTime.now().toIso8601String())
]));


class TodoProvider extends StateNotifier<List<Todo>>{
  TodoProvider(super.state);


  void add(Todo todo){
     state = [...state, todo];
  }

  void remove(Todo todo){
    state.remove(todo);
    state = [...state];
  }

  void edit(Todo newTodo){
    final prevTodo = state.firstWhere((element) => element.dateTime == newTodo.dateTime);
    state = [
      for(final m in  state)  if(m == prevTodo) newTodo else m
    ];
  }


}