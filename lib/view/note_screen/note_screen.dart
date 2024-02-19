import 'package:flutter/material.dart';
import 'package:poductivity_app/constants/colorconstant.dart';
import 'package:poductivity_app/controller/api_controller/api_service_controller.dart';
import 'package:poductivity_app/controller/darktheme_controller/darktheme_controller.dart';
import 'package:poductivity_app/view/note_screen/note_add.dart';
import 'package:poductivity_app/view/note_screen/note_description.dart';
import 'package:poductivity_app/widgets/notecontainer.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

List notelist = [
  [
    "jkhvjhk",
    "jnkvhjsrhhjhj huirghriku ghrhrwhu bghrhgrhjg hujrhurhuj uhjrhujkrhuj ghje3gy3rgygygegyegyewrfdygedwrdgyerqgyutqerdygutqe3ygtuqwygtu"
  ],
  [
    "jkhvjhk",
    "jnkvhjsrhhjhj huirghriku ghrhrwhu bghrhgrhjg hujrhurhuj uhjrhujkrhuj"
  ],
  [
    "jkhvjhk",
    "jnkvhjsrhhjhj huirghriku ghrhrwhu bghrhgrhjg hujrhurhuj uhjrhujkrhuj"
  ]
];

class _NoteScreenState extends State<NoteScreen> {
  @override
  void initState() {
    Provider.of<ApiServiceController>(context, listen: false).getNotes();
    super.initState();
  }

  var obj = ApiServiceController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ApiServiceController>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Provider.of<DarkthemeCpntroller>(context).primarycolor,
        body: ListView.builder(
          itemCount: provider.notes.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteDescrption(
                          index: index,
                        ))),
            child: NoteContainer(
                category: provider.notes[index]['categorize_note'],
                content: provider.notes[index]['content'],
                date: provider.notes[index]['created_at'],
                title: provider.notes[index]['title']),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConstant.primarygreen,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NoteAdd(
                      noteid: 0,
                      category: '',
                      contnte: '',
                      title: '',
                      edit: false),
                ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
