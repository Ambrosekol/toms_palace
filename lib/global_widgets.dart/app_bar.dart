import 'package:flutter/material.dart';
import 'package:toms_palace/util/firebaseinstance.dart';
import 'package:toms_palace/util/imagedirectory.dart';

class CustomizedAppBar extends StatefulWidget with PreferredSizeWidget {
  CustomizedAppBar({super.key, required this.centerTitle});
  final bool centerTitle;
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
  @override
  State<CustomizedAppBar> createState() => _CustomizedAppBarState();
}

class _CustomizedAppBarState extends State<CustomizedAppBar> {
  String usernmae = 'Adeyemi';

  baseLinePage() {
    Navigator.popUntil(context, (route) => false);
    Navigator.pushNamed(context, '/');
    // (context, ModalRoute.withName('/'));
  }

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
          menuItems(size, context, widget.centerTitle)
        ],
      ),
    );
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
                      onPressed: () {}, // SEARCH ICON FUNCTION
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                        size: 30.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () => showDropdownMenus(context),
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
                      onTap: () {}, // USER'S CART
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

  showDropdownMenus(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20.0,
                          child: Image.asset(
                            imageLocation(imageName: 'usertestImage.png'),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Hi, $usernmae',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 3.0,
                  ),
                  dialogItem(
                      textItem: 'My Account',
                      callback: () {},
                      icon: Icons.person),
                  dialogItem(
                      textItem: 'Order History',
                      callback: () {},
                      icon: Icons.history),
                  dialogItem(
                      textItem: 'Track Order',
                      callback: () {
                        // print('object is a goo ');
                      },
                      icon: Icons.map),
                  const Divider(
                    height: 2.0,
                    thickness: 2.0,
                  ),
                  dialogItem(
                      textItem: 'Sign Out',
                      callback: () async {
                        await authInstance.signOut();
                        baseLinePage();
                      },
                      icon: Icons.logout),
                ],
              ),
            ),
          );
        });
  }

  Widget dialogItem(
      {required String textItem,
      required Function() callback,
      required IconData icon}) {
    return InkWell(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.surface,
        height: 50.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Text(
              textItem,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
