import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/AppState.dart';
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
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }),
          MenuItem(
              text: 'Socios',
              icon: Icons.people,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, 'partners', (route) => false);
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
                Navigator.pushNamedAndRemoveUntil(context, 'loans', (route) => false);
              }),
          Divider(),
          Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: MenuItem(
                    text: 'Ajustes',
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.pushNamed(context, 'settings');
                    })),
          ),
          MenuItem(
              text: 'Salir',
              icon: Icons.exit_to_app,
              onTap: () => Provider.of<AppState>(context).logout())
        ],
      ),
    );
  }
}
