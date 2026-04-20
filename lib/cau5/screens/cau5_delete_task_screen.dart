import 'package:flutter/material.dart';

import '../controllers/cau5_task_controller.dart';
import '../data/models/cau5_task_model.dart';

class Cau5DeleteTaskScreen extends StatefulWidget {
  const Cau5DeleteTaskScreen({super.key});

  @override
  State<Cau5DeleteTaskScreen> createState() => _Cau5DeleteTaskScreenState();
}

class _Cau5DeleteTaskScreenState extends State<Cau5DeleteTaskScreen> {
  final Cau5TaskController _controller = Cau5TaskController();

  bool _isLoading = true;
  String? _error;
  List<Cau5TaskModel> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final tasks = await _controller.getTasks();
      if (!mounted) {
        return;
      }

      setState(() {
        _tasks = tasks;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _error = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<bool> _deleteTask(Cau5TaskModel task) async {
    try {
      await _controller.deleteTask(task.id);

      if (!mounted) {
        return false;
      }

      setState(() {
        _tasks = _tasks.where((item) => item.id != task.id).toList();
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Deleted task #${task.id}')));
      return true;
    } catch (error) {
      if (!mounted) {
        return false;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Delete failed: $error')));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cau 5 - Delete Item')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error: $_error', textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _loadTasks,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            )
          : _tasks.isEmpty
          ? const Center(child: Text('No tasks found'))
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Dismissible(
                  key: ValueKey(task.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (_) => _deleteTask(task),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(task.id.toString())),
                    title: Text(task.title),
                    subtitle: Text(
                      task.completed ? 'Completed' : 'Pending',
                      style: TextStyle(
                        color: task.completed ? Colors.green : Colors.orange,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _deleteTask(task);
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
