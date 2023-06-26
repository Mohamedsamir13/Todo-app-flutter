import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Component/TaskItem.dart';
import 'package:todoapp/data/Cubit/states.dart';

import '../data/Cubit/cubit.dart';class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        final cubit = AppCubit.i(context);
        if (cubit.archivedTasks.isEmpty) {
          return  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.hourglass_empty_outlined),
                Text("No Archived Tasks"),
              ],
            ),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) => TaskItem(
            task: cubit.archivedTasks[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: cubit.archivedTasks.length,
        );
      },
    );
  }
}