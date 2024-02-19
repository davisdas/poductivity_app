import 'package:flutter/material.dart';
import 'package:poductivity_app/constants/colorconstant.dart';
import 'package:poductivity_app/controller/api_controller/api_service_controller.dart';
import 'package:poductivity_app/controller/darktheme_controller/darktheme_controller.dart';
import 'package:poductivity_app/view/note_screen/note_add.dart';
import 'package:provider/provider.dart';

class NoteDescrption extends StatefulWidget {
  const NoteDescrption({super.key, required this.index});
  final int index;
  @override
  State<NoteDescrption> createState() => _NoteDescrptionState();
}

class _NoteDescrptionState extends State<NoteDescrption> {
  @override
  Widget build(BuildContext context) {
    var currentnotes =
        Provider.of<ApiServiceController>(context).notes[widget.index];
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NoteAdd(
                              category: currentnotes['categorize_note'],
                              contnte: currentnotes['content'],
                              title: currentnotes['title'],
                              noteid: currentnotes['id'],
                              edit: true,
                            )));
              },
              icon: Icon(
                Icons.edit,
                color: provider.secondrycolor,
              )),
          IconButton(
              onPressed: () {
                Provider.of<ApiServiceController>(context, listen: false)
                    .deletenote(currentnotes['id'], context);
              },
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
                currentnotes['title'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: provider.secondrycolor,
                    fontSize: 27),
              ),
              Row(
                children: [
                  Text(
                    currentnotes['created_at'],
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
                        currentnotes['categorize_note'],
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
                currentnotes['content'],
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
