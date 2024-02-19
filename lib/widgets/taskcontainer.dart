import 'package:flutter/material.dart';
import 'package:poductivity_app/constants/colorconstant.dart';
import 'package:poductivity_app/controller/api_controller/api_service_controller.dart';
import 'package:poductivity_app/controller/darktheme_controller/darktheme_controller.dart';
import 'package:provider/provider.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    super.key,
    required this.title,
    required this.content,
    required this.createddate,
    required this.dueddate,
    required this.status,
    required this.taskid,
  });
  final String title;
  final String content;
  final String createddate;
  final String dueddate;
  final bool status;
  final int taskid;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DarkthemeCpntroller>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 6, right: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          style: TextStyle(
                              letterSpacing: 1.2,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: provider.secondrycolor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          content,
                          maxLines: 4,
                          style: TextStyle(
                              letterSpacing: 1,
                              wordSpacing: 1.2,
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: provider.secondrycolor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              createddate,
                              style: TextStyle(color: provider.secondrycolor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 111, 110, 110)
                                          .withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 3, top: 3),
                                  child: Text(
                                    "Due : $dueddate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: provider.secondrycolor,
                                        fontStyle: FontStyle.italic),
                                  )),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              InkWell(
                onTap: () =>
                    Provider.of<ApiServiceController>(context, listen: false)
                        .changestatus(taskid, status),
                child: Container(
                  decoration: BoxDecoration(
                      color: status == false
                          ? Colors.grey
                          : ColorConstant.primarygreen,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      status == false ? 'pending' : "Done",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: provider.secondrycolor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
