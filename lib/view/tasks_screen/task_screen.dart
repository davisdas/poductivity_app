import 'package:flutter/material.dart';
import 'package:poductivity_app/constants/colorconstant.dart';
import 'package:poductivity_app/controller/api_controller/api_service_controller.dart';
import 'package:poductivity_app/controller/darktheme_controller/darktheme_controller.dart';
import 'package:poductivity_app/view/tasks_screen/task_description.dart';
import 'package:poductivity_app/widgets/taskcontainer.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    Provider.of<ApiServiceController>(context, listen: false).gettask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ApiServiceController>(context);
    return Scaffold(
      backgroundColor: Provider.of<DarkthemeCpntroller>(context).primarycolor,
      body: ListView.builder(
        itemCount: provider.task.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskDescription(
                        content: provider.task[index]['description'],
                        createddate: provider.task[index]['created_time'],
                        dueddate: provider.task[index]['reminded_date'],
                        status: provider.task[index]['status'],
                        title: provider.task[index]['title'],
                        taskid: provider.task[index]['id'],
                      ))),
          child: TaskContainer(
            content: provider.task[index]['description'],
            createddate: provider.task[index]['created_time'],
            title: provider.task[index]['title'],
            dueddate: provider.task[index]['reminded_date'],
            status: provider.task[index]['status'],
            taskid: provider.task[index]['id'],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.primarygreen,
        onPressed: () {
          Provider.of<ApiServiceController>(context, listen: false).addstask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
