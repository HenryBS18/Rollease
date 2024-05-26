import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/LogoUtama.png',
                      width: 123,
                      height: 104,
                    ),
                    const SizedBox(height: 4),
                    const Divider(color: Color.fromARGB(99, 166, 166, 166)),
                    const SizedBox(height: 4),
                    buildMenuItem(
                      context,
                      icon: Icons.people,
                      text: 'Profile',
                    ),
                    const SizedBox(height: 4),
                    const Divider(color: Color.fromARGB(99, 166, 166, 166)),
                    const SizedBox(height: 4),
                    buildMenuItem(context, icon: Icons.account_balance_wallet, text: 'Payment'),
                    const SizedBox(height: 4),
                    const Divider(color: Color.fromARGB(99, 166, 166, 166)),
                    const SizedBox(height: 4),
                    buildMenuItem(context, icon: Icons.history, text: 'Riding History'),
                    const SizedBox(height: 4),
                    const Divider(color: Color.fromARGB(99, 166, 166, 166)),
                    const SizedBox(height: 4),
                    buildMenuItem(context, icon: Icons.confirmation_num, text: 'Promos'),
                    const SizedBox(height: 4),
                    const Divider(color: Color.fromARGB(99, 166, 166, 166)),
                    const SizedBox(height: 4),
                    buildMenuItem(context, icon: Icons.file_copy, text: 'Terms & Conditions'),
                    const SizedBox(height: 4),
                    const Divider(color: Color.fromARGB(99, 166, 166, 166)),
                    const SizedBox(height: 4),
                    buildMenuItem(context, icon: Icons.settings, text: 'Settings'),
                    const SizedBox(height: 4),
                    const Divider(color: Color.fromARGB(99, 166, 166, 166)),
                    const SizedBox(height: 4),
                    buildMenuItem(context, icon: Icons.logout, text: 'Log Out'),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem(BuildContext context, {required String text, required IconData icon}) {
    const color = Color.fromARGB(100, 162, 201, 12);

    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(text, style: const TextStyle(color: color, fontSize: 16)),
        onTap: () {},
      ),
    );
  }
}
