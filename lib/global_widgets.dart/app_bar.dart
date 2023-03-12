import 'package:flutter/material.dart';

class CustomizedAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomizedAppBar({super.key, required this.centerTitle});
  bool centerTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(right: 10.0),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.menu,
              size: 25.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          menuItems(size, context, centerTitle)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

Widget menuItems(Size size, BuildContext context, bool centerTitle) {
  return Container(
    // color: Colors.yellow,
    width: size.width / 1.8,
    alignment: Alignment.bottomRight,
    child: centerTitle
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/foodlogo.jpg',
                width: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => null,
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                      size: 30.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  InkWell(
                    onTap: () => null,
                    child: Material(
                      shape: const CircleBorder(),
                      color: Theme.of(context).primaryColor,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  InkWell(
                    onTap: () => null,
                    child: Material(
                      shape: const CircleBorder(),
                      color: Theme.of(context).primaryColor,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset(
              'assets/images/foodlogo.jpg',
              width: 50,
            ),
          ),
  );
}
