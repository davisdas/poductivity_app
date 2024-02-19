import 'package:flutter/material.dart';
import 'package:poductivity_app/constants/colorconstant.dart';
import 'package:poductivity_app/controller/api_controller/api_service_controller.dart';
import 'package:poductivity_app/controller/darktheme_controller/darktheme_controller.dart';
import 'package:provider/provider.dart';

class TaskDescription extends StatefulWidget {
  const TaskDescription(
      {super.key,
      required this.title,
      required this.content,
      required this.createddate,
      required this.dueddate,
      required this.status,
      required this.taskid});
  final String title;
  final String content;
  final String createddate;
  final String dueddate;
  final bool status;
  final int taskid;
  @override
  State<TaskDescription> createState() => _TaskDescriptionState();
}

class _TaskDescriptionState extends State<TaskDescription> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DarkthemeCpntroller>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: provider.primarycolor,
      appBar: AppBar(
        backgroundColor: provider.primarycolor,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: provider.secondrycolor)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: provider.secondrycolor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: provider.secondrycolor,
                    fontSize: 27),
              ),
              Row(
                children: [
                  Text(
                   widget.createddate,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: provider.secondrycolor,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.primarygreen,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, bottom: 3, top: 3),
                      child: Text(
                        widget.status.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: provider.secondrycolor,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.content,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: provider.secondrycolor,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
