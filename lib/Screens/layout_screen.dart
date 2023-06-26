import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Component/AppDrawer.dart';
import 'package:todoapp/Screens/ArchivedScreen.dart';
import 'package:todoapp/Screens/DoneScreen.dart';
import 'package:todoapp/Screens/NewTasks.dart';
import 'package:todoapp/Screens/add_Task_buttom_sheet.dart';
import 'package:todoapp/data/Cubit/cubit.dart';
import 'package:todoapp/data/Cubit/states.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  String title = "New tasks";
  Widget screen = const NewTasksScreen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          drawerScrimColor: Colors.transparent,
          drawer: const AppDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.blue,
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
                switch (index) {
                  case 0:
                    title = "New tasks";
                    screen =const NewTasksScreen();
                    break;
                  case 1:
                    title = "Done tasks";
                    screen = const DoneTasksScreen();
                    break;
                  default:
                    title = "Archived tasks";
                    screen = const ArchivedTasksScreen();
                }
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.task), label: "New"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done_all), label: "Done"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive), label: "Archive"),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AddTaskBottomSheet.push(context);
            },
            child: const Icon(Icons.add),
          ),
          body: screen,
        );
      },
    );
  }
}