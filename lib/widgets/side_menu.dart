import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: FlutterLogo(size: 100),
          ),
          DrawerListTile(
            title: "Dashboard",
            iconData: Icons.dashboard,
            press: () {},
          ),
          DrawerListTile(
            title: "Notification",
            iconData: Icons.notifications,
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            iconData: Icons.person,
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            iconData: Icons.settings,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.press,
  });

  final String title;

  final IconData iconData;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Icon(
        iconData,
      ),
      title: Text(
        title,
      ),
    );
  }
}
