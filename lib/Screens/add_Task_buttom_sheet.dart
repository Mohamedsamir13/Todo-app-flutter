import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Component/app_text_feild.dart';
import 'package:todoapp/data/Cubit/cubit.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  static void push(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (context) => const AddTaskBottomSheet(),
    );
  }

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var timeController = TextEditingController();

  var dateController = TextEditingController();
  void _onpressed() {
    if (formKey.currentState!.validate()) {
      AppCubit.i(context).insertIntoDatabase(
          title: titleController.text,
          time: timeController.text,
          date: dateController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    //final cubit = AppCubit.i(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: 120,
              height: 3,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 20),
            AppTextField(
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "title is required";
                }
                return null;
              },
              label: const Text("Task title"),
              prefixIcon: const Icon(Icons.title_outlined),
            ),
            const SizedBox(
              height: 15,
            ),
            AppTextField(
              controller: timeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "time is required";
                }
                return null;
              },
              readOnly: true,
              label: const Text("Task time"),
              onTab: () async {
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  timeController.text = time.format(context);
                }
              },
              prefixIcon: const Icon(Icons.timer),
            ),
            const SizedBox(
              height: 15,
            ),
            AppTextField(
              readOnly: true,
              controller: dateController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "date is required";
                }
                return null;
              },
              label: const Text("Task date"),
              onTab: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
                );
                if (date != null) {
                  dateController.text = DateFormat.yMMMd().format(date);
                }
              },
              prefixIcon: const Icon(Icons.date_range),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton.icon(
                onPressed: _onpressed,
                label: const Text("Add"),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}