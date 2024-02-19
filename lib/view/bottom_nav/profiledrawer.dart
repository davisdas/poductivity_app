import 'package:flutter/material.dart';
import 'package:poductivity_app/constants/colorconstant.dart';
import 'package:poductivity_app/controller/darktheme_controller/darktheme_controller.dart';
import 'package:poductivity_app/controller/sharedpref_controller/sharedprefcontroller.dart';
import 'package:poductivity_app/view/login_and_registration/login_page.dart';
import 'package:provider/provider.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  var obj = SharedPrefController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DarkthemeCpntroller>(context);
    return Drawer(
      backgroundColor: provider.primarycolor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: ColorConstant.primarygreen)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 3, bottom: 3),
                        child: Text(
                          "Close",
                          style: TextStyle(
                              color: ColorConstant.primarygreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 60,
              backgroundColor: ColorConstant.primarygreen,
            ),
            const SizedBox(height: 10),
            Text(
              "Username",
              style: TextStyle(
                  color: provider.secondrycolor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
            InkWell(
              onTap: () {
                obj.logoutuser();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstant.primarygreen),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: provider.secondrycolor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
