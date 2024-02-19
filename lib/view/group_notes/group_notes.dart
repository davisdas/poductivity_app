import 'package:flutter/material.dart';
import 'package:poductivity_app/controller/api_controller/api_service_controller.dart';
import 'package:poductivity_app/controller/darktheme_controller/darktheme_controller.dart';
import 'package:poductivity_app/widgets/notecontainer.dart';
import 'package:provider/provider.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    //  var provider = Provider.of<ApiServiceController>(context);
    return Scaffold(
      backgroundColor: Provider.of<DarkthemeCpntroller>(context).primarycolor,
      body: ListView.builder(
        itemBuilder: (context, index) => const NoteContainer(
            title: "title",
            content: 'hjnhjnshjbnhjbn bhghuhj huigrehuirhu huireghui',
            date: "10 - 2 - 2023_",
            category: "school"),
      ),
    );
  }
}
