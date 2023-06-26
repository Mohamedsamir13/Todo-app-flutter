import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp/Models/Task_Model.dart';
import 'package:todoapp/data/Cubit/states.dart';
import 'package:todoapp/data/localDataSource/Sqflight.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit i(BuildContext context) => BlocProvider.of<AppCubit>(context);
  List<TaskModel> tasks = [];
  List<TaskModel> doneTasks = [];
  List<TaskModel> archivedTasks = [];
  final LocalDataSource _dataSource = LocalDataSource();

  void restTasks() {
    tasks = [];
    doneTasks = [];
    archivedTasks = [];
  }

  Future<void> insertIntoDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    try {
      await _dataSource.insertIntoDatabase(
        title: title,
        time: time,
        date: date,
      );
      getData();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getData() async {
    restTasks();
    final res = await _dataSource.getData();
    res.forEach((item) {
      setTasks(item);
    });

    emit(GetDataState());
  }

  void setTasks(Map<String, dynamic> task) {
    final taskModel = TaskModel.fromJson(task);
    final String status = task["status"];
    if (status == "new") {
      tasks.add(taskModel);
    } else if (status == "done") {
      doneTasks.add(taskModel);
    } else {
      archivedTasks.add(taskModel);
    }
  }

  Future<void> updateData({required int id, required String status}) async {
    await _dataSource.updateDatabase(status: status, id: id);
    getData();
  }

  Future<void> deleteData({required int id}) async {
    await _dataSource.deleteDatabase(id: id);
    getData();
  }
}