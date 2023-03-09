import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/contants/gap_sizes.dart';
import 'package:sampleflutter/models/todo.dart';
import 'package:sampleflutter/providers/todo_provider.dart';

import '../common_widgets/toasts_show.dart';


class HomePage extends StatelessWidget {

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Consumer(
            builder: (context, ref, child) {
              final todoData = ref.watch(todoProvider);
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: todoController,
                      onFieldSubmitted: (val) {
                        if(val.isEmpty){
                         ToastShow.showFailure('field required');
                        }else{
                          final newTodo = Todo(
                              title: val,
                              dateTime: DateTime.now().toString()
                          );
                          ref.read(todoProvider.notifier).add(newTodo);
                          todoController.clear();
                        }

                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        hintText: 'add some todo',
                        border: OutlineInputBorder(),
                        // suffixIcon: Icon(Icons.add),
                        // prefixIcon: Icon(Icons.add),
                      ),
                    ),
                    gapH12,
                    Expanded(
                        child: ListView.builder(
                          itemCount: todoData.length,
                            itemBuilder: (context, index){
                            final todo = todoData[index];
                            return ListTile(
                              leading: Icon(Icons.date_range),
                              title: Text(todo.title),
                              subtitle: Text(todo.dateTime),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(onPressed: (){
                                    showDialog(context: context, builder: (context) => AlertDialog(
                                      title: Text('update your todo'),
                                      content: TextFormField(
                                        initialValue: todo.title,
                                        onFieldSubmitted: (val){
                                          Navigator.of(context).pop();
                                          ref.read(todoProvider.notifier).edit(
                                            Todo(title: val, dateTime: todo.dateTime)
                                          );
                                        },
                                      ),
                                    ));

                                    }, icon: Icon(Icons.edit)),
                                    IconButton(onPressed: (){
                                      ref.read(todoProvider.notifier).remove(todo);
                                    }, icon: Icon(Icons.delete)),
                                  ],
                                ),
                              ),
                            );
                            }
                        )
                    )
                  ],
                ),
              );
            }
          ),
        )
    );
  }
}
