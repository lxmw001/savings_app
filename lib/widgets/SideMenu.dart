import 'package:flutter/material.dart';
import '../pages/PartnerPage.dart';
import '../pages/HomePage.dart';
import '../pages/LoanPage.dart';
import '../pages/SettingsPage.dart';
import './MenuItem.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("lx.mw001"),
            accountName: Text("Luis Gonzalez"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn2.iconfinder.com/data/icons/new-year-resolutions/64/resolutions-24-512.png")),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          MenuItem(
              text: 'Home',
              icon: Icons.home,
              onTap: () {
                //back to the main page
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage())
                );
              }),
          MenuItem(
              text: 'Socios',
              icon: Icons.people,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PartnerPage()));
              }),
          MenuItem(
              text: 'Cuotas',
              icon: Icons.attach_money,
              onTap: () {
                print("cuotas");
              }),
          MenuItem(
              text: 'Prestamos',
              icon: Icons.monetization_on,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoanPage()));
              }),
          Divider(),
          Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: MenuItem(
                    text: 'Ajustes',
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    })),
          )
        ],
      ),
    );
  }
}
