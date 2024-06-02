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
        appBar: const CustomAppBar(title: "Profile", icon: Icons.person_outline),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: CustomColors.primary,
                      width: 10,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.person_outline,
                      size: 56,
                      color: CustomColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Full Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    TextFieldWithIcon(
                      value: "Henry Bintang Setiawan",
                      icon: CupertinoIcons.person,
                      enabled: isEdit,
                      focusNode: _focusNodeName,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    TextFieldWithIcon(
                      value: "henry@gmail.com",
                      icon: CupertinoIcons.mail,
                      enabled: isEdit,
                      focusNode: _focusNodeEmail,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Birth of Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    TextFieldWithIcon(
                      value: "12/1/2003",
                      icon: CupertinoIcons.calendar,
                      enabled: isEdit,
                      focusNode: _focusNodeBirthDate,
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1400),
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
                              ),
                      ),
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
