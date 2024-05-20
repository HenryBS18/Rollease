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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16),
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
              SizedBox(height: 16),
              Divider(),
              ListTile(leading: Icon(Icons.person), title: Text("Profile"), onTap: () {}),
              Divider(),
              ListTile(leading: Icon(Icons.payment), title: Text("Payment"), onTap: () {}),
              Divider(),
              ListTile(leading: Icon(Icons.history), title: Text("Riding History"), onTap: () {}),
              Divider(),
              ListTile(leading: Icon(Icons.airplane_ticket), title: Text("Promos"), onTap: () {}),
              Divider(),
              ListTile(leading: Icon(Icons.assignment_turned_in), title: Text("Terms & Conditions"), onTap: () {}),
              Divider(),
              ListTile(leading: Icon(Icons.settings), title: Text("Settings"), onTap: () {}),
              Divider(),
            ],
          )
        ],
      ),
    );
  }
}
