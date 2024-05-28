import 'package:ToDoo/app/model/task.dart';
import 'package:ToDoo/app/view/components/h1.dart';
import 'package:ToDoo/app/view/components/shape.dart';
import 'package:ToDoo/app/view/task_list/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider()..getTasks(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            const Expanded(child: _TaskList()),
          ],
        ),
        floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                  onPressed: () => _showNewTaskModal(context),
                  child: const Icon(Icons.add, size: 50),
                )),
      ),
    );
  }

  _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => ChangeNotifierProvider.value(
        value: context.read<TaskProvider>(),
        child: _NewTaskModal(),
      ),
    );
  }
}

class _NewTaskModal extends StatelessWidget {
  _NewTaskModal({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: 23,
            right: 23,
            top: 33,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const H1("Nueva Tarea"),
            const SizedBox(
              height: 26,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                onSubmitted: (value) {
                  if (_controller.text.isNotEmpty) {
                    final task = Task(_controller.text);
                    context.read<TaskProvider>().addNewTask(task);
                    Navigator.of(context).pop();
                  }
                },
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Descripción de la tarea',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    final task = Task(_controller.text);
                    context.read<TaskProvider>().addNewTask(task);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Guardar")),
            const SizedBox(
              height: 33,
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskList extends StatelessWidget {
  const _TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 35,
          ),
          child: H1('Tareas'),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Consumer<TaskProvider>(
                builder: (_, provider, __) {
                  if (provider.taskList.isEmpty) {
                    return const Center(child: Text('No hay tareas'));
                  }
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: ListView.separated(
                      itemCount: provider.taskList.length,
                      itemBuilder: (_, index) => _TaskItem(
                          provider.taskList[index],
                          onTap: () => provider
                              .onTaskDoneChange(provider.taskList[index])),
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {super.key, this.onTap});

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 21),
          child: Row(
            children: [
              task.done
                  ? Icon(
                      Icons.check_box_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Icon(
                      Icons.check_box_outline_blank_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              const SizedBox(width: 10),
              Text(task.title),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          const Row(children: [Shape()]),
          Column(
            children: [
              Image.asset(
                'assets/images/tasks-list-image.png',
                width: 120,
                height: 120,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: H1('Completa tus tareas', color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
