part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodeBirthDate = FocusNode();

  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    _focusNodeName.addListener(_onFocusChange);
    _focusNodeEmail.addListener(_onFocusChange);
    _focusNodeBirthDate.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _unfocusAllFields() {
    _focusNodeName.unfocus();
    _focusNodeEmail.unfocus();
    _focusNodeBirthDate.unfocus();
  }

  @override
  void dispose() {
    _focusNodeName.removeListener(_onFocusChange);
    _focusNodeEmail.removeListener(_onFocusChange);
    _focusNodeBirthDate.removeListener(_onFocusChange);

    _focusNodeName.dispose();
    _focusNodeEmail.dispose();
    _focusNodeBirthDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusAllFields,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 20,
              color: Colors.black,
            ),
          ),
          title: const Text(
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
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: CustomColors.primary,
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Profile",
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
                SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFFA2C90C),
                      width: 8,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: const Icon(
                      Icons.person_outline,
                      size: 48,
                      color: Color(0xFFA2C90C),
                    ),
                  ),
                ),
                SizedBox(height: 24),
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
                    SizedBox(height: 2),
                    TextFieldWithIcon(
                      value: "Henry Bintang Setiawan",
                      icon: CupertinoIcons.person,
                      enabled: isEdit,
                      focusNode: _focusNodeName,
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Email Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 2),
                    TextFieldWithIcon(
                      value: "henry@gmail.com",
                      icon: CupertinoIcons.mail,
                      enabled: isEdit,
                      focusNode: _focusNodeEmail,
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Birth of Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 2),
                    TextFieldWithIcon(
                      value: "12/1/2003",
                      icon: CupertinoIcons.calendar,
                      enabled: isEdit,
                      focusNode: _focusNodeBirthDate,
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: !isEdit
                              ? PrimaryIconButton(
                                  title: "Edit",
                                  icon: Icons.edit_document,
                                  onTap: () {
                                    setState(() {
                                      isEdit = true;
                                    });
                                  },
                                )
                              : PrimaryIconButton(
                                  title: "Save",
                                  icon: Icons.save,
                                  onTap: () {
                                    setState(() {
                                      isEdit = false;
                                    });
                                  },
                                )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
