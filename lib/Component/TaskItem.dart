import 'package:flutter/material.dart';
import 'package:todoapp/Models/Task_Model.dart';import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp/data/Cubit/cubit.dart';
import 'package:todoapp/data/Cubit/states.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key, required this.task}) : super(key: key);
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) => Dismissible(
        key: Key(task.id.toString()),
        onDismissed: (direction) {
          AppCubit.i(context).deleteData(id: task.id);
        },
        child: Container(
width: double.infinity,
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              CircleAvatar(
                child: Text("${task.id}"),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Text(
                        task.time,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        task.date,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              if (task.status != "done")
                IconButton(

                    onPressed: () {

                      AppCubit.i(context)
                          .updateData(id: task.id, status: "done",);
                    },
                    icon: const Icon(Icons.done,color: Colors.black,),
                    color: Colors.white),
              if (task.status != "archive")
                IconButton(
                    onPressed: () {
                      AppCubit.i(context)
                          .updateData(id: task.id, status: "archive");
                    },
                    icon: const Icon(Icons.archive,),
                    color: Colors.black,padding: EdgeInsets.all(10)),
            ],
          ),
        ),
      ),
    );
  }
}
