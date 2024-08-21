import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TaskBodyManager extends StatefulWidget {
  const TaskBodyManager({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskBodyManagerState createState() => _TaskBodyManagerState();
}

class _TaskBodyManagerState extends State<TaskBodyManager> {
  List<TaskBody> taskBodies = [];

  void _addTaskBody() {
    setState(() {
      taskBodies.add(TaskBody(onConfirm: _removeTaskBody));
    });
  }

  void _removeTaskBody(TaskBody taskBody) {
    setState(() {
      taskBodies.remove(taskBody);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskBodies.length + 1,
      itemBuilder: (context, index) {
        if (index == taskBodies.length) {
          return _buildAddButton();
        }
        return taskBodies[index];
      },
    );
  }

  Widget _buildAddButton() {
    return MaterialButton(
  onPressed:_addTaskBody,
  color: Colors.black,
  textColor: Colors.white,
  padding: const EdgeInsets.all(5),
  shape: const CircleBorder(),
  child: const Icon(
    Icons.add,
    size: 20,
  ),
);
  }
}

class TaskBody extends StatefulWidget {
  final Function(TaskBody) onConfirm;

  const TaskBody({super.key, required this.onConfirm});

  @override
  // ignore: library_private_types_in_public_api
  _TaskBodyState createState() => _TaskBodyState();
}

class _TaskBodyState extends State<TaskBody> {
  String value1 = '';
  String value2 = '';

  void _onConfirm() {
    if (kDebugMode) {
      print('$value1 $value2 button pressed!');
    }
    widget.onConfirm(widget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDropdownRow("To", [
            const DropdownMenuEntry(value: "maharagama", label: "maharagama hospital"),
            const DropdownMenuEntry(value: "kalupovila", label: "kalupovila hospital"),
          ], (value) => value1 = value ?? ''),
          const SizedBox(height: 8.0),
          _buildDropdownRow("at", [
            const DropdownMenuEntry(value: "4.30pm", label: "4.30pm"),
            const DropdownMenuEntry(value: "6.00pm", label: "6.00pm"),
          ], (value) => value2 = value ?? ''),
          const SizedBox(height: 8.0),
          _buildConfirmButton(),
        ],
      ),
    );
  }

  Widget _buildDropdownRow(String label, List<DropdownMenuEntry<String>> items, ValueChanged<String?> onChanged) {
    return Row(
      children: [
        Text(label),
        const SizedBox(width: 8.0),
        DropdownMenu(
          dropdownMenuEntries: items,
          onSelected: (value) {
            setState(() {
              onChanged(value);
            });
            if (kDebugMode) {
              print(value);
            }
          },
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: _onConfirm,
      style: ElevatedButton.styleFrom(
      minimumSize: const Size(50, 25),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(70),
      ),
        backgroundColor: Colors.blue,
      
    ),
    child: const Text(
      "Confrim Pre-planned",
      style: TextStyle(fontSize: 10,color: Colors.white),
    ),
    );
  }
}