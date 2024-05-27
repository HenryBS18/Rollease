part of 'widgets.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7388,
                      height: 132,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/Logo Utama.png",
                            width: 132,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Henry",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Profile"),
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.payment),
                      title: const Text("Payment"),
                      onTap: () {
                        Navigator.pushNamed(context, '/payment');
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text("Riding History"),
                      onTap: () {
                        Navigator.pushNamed(context, '/history');
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.confirmation_num),
                      title: const Text("Promos"),
                      onTap: () {
                        Navigator.pushNamed(context, '/promo');
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.file_copy),
                      title: const Text("Terms & Conditions"),
                      onTap: () {
                        Navigator.pushNamed(context, '/tnc');
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Settings"),
                      onTap: () {},
                    ),
                    const Divider(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Color(0xffFC6464),
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Color(0xffFC6464), fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
