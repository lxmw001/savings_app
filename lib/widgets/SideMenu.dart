import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './MenuItem.dart';
import '../states/AppState.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    var user = appState.getCurrentUser();
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(user.email),
            accountName: Text(user.displayName),
            currentAccountPicture:
                CircleAvatar(backgroundImage: NetworkImage(user.photoUrl)),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          MenuItem(
              text: 'Home',
              icon: Icons.home,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              }),
          MenuItem(
              text: 'Socios',
              icon: Icons.people,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'partners', (route) => false);
              }),
          MenuItem(
              text: 'Prestamos',
              icon: Icons.monetization_on,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, 'loans', (route) => false);
              }),
          MenuItem(
              text: 'Pagos',
              icon: Icons.attach_money,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'partnerPayments', (route) => false);
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
              onTap: () => appState.logout())
        ],
      ),
    );
  }
}
