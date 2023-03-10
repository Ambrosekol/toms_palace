import 'package:flutter/material.dart';

class CustomizedAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomizedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 25.0, right: 10.0, left: 10.0, bottom: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor,
            blurRadius: 5.0,
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.menu,
              size: 25.0,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
