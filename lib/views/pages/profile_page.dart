part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Back",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFFA2C90C),
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFFA2C90C),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  itemProfile(
                    'Hendry Bintang Setiawan',
                    CupertinoIcons.person,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'E-mail Address',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  itemProfile(
                    'hendry@gmail.com',
                    CupertinoIcons.mail,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Birth of Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  itemProfile(
                    '11/1/2003',
                    CupertinoIcons.calendar,
                  ),
                  SizedBox(height: 20),
                  FadeInUp(
                    duration: Duration(milliseconds: 1400),
                    child: Center(
                      // Center the Edit button
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          MaterialButton(
                            height: 45,
                            minWidth: 130,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfilePage(),
                                ),
                              );
                            },
                            color: Color(0xFFA2C90C),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFA2C90C),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.edit_square,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
