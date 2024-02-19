import 'package:flutter/material.dart';
import 'package:poductivity_app/controller/darktheme_controller/darktheme_controller.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DarkthemeCpntroller>(context);
    return Scaffold(
      backgroundColor: provider.primarycolor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here . ",
                      hintStyle: TextStyle(
                          color: provider.secondrycolor.withOpacity(0.5))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
