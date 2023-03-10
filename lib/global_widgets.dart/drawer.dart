import 'package:flutter/material.dart';

class CustomizedDrawer extends StatelessWidget {
  CustomizedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width / 2,
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        primary: true,
        children: [
          SizedBox(height: 40),
          drawerItem(context, "Sign In", () => null),
          SizedBox(height: 15),
          drawerItem(context, "Join", () => null),
          SizedBox(height: 15),
          drawerItem(context, "Menus", () => null),
          SizedBox(height: 15),
          drawerItem(context, "Map", () => null),
          SizedBox(height: 15),
          drawerItem(context, "Contact Us", () => null),
        ],
      ),
    );
  }

  Widget drawerItem(BuildContext context, String title, Function() callback) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      width: size.width / 2,
      height: 50.0,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: callback,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
                // textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.8,
            )
          ],
        ),
      ),
    );
  }
}
