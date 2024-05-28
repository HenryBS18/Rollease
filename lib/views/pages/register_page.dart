part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _focusNodeName.addListener(_onFocusChange);
    _focusNodeEmail.addListener(_onFocusChange);
    _focusNodePassword.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _unfocusAllFields() {
    _focusNodeName.unfocus();
    _focusNodeEmail.unfocus();
    _focusNodePassword.unfocus();
  }

  @override
  void dispose() {
    _focusNodeName.removeListener(_onFocusChange);
    _focusNodeEmail.removeListener(_onFocusChange);
    _focusNodePassword.removeListener(_onFocusChange);

    _focusNodeName.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _unfocusAllFields();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Container(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1200),
                          child: Text(
                            "Silahkan mengisi kelengkapan data untuk membuat akun",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        child: Image.asset(
                          'assets/LoginSignup.png',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      SizedBox(
                        height: 54,
                        child: TextFormField(
                          focusNode: _focusNodeName,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'John Doe',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffA2C90C),
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      SizedBox(
                        height: 54,
                        child: TextFormField(
                          focusNode: _focusNodeEmail,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'henry@gmail.com',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffA2C90C),
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Birth Date',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const SizedBox(
                        height: 54,
                        child: DateField(),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      PasswordField(focusNode: _focusNodePassword),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            splashColor: const Color(0xFFA2C90C),
                            child: Checkbox(
                              value: isChecked,
                              onChanged: (newValue) {
                                setState(() {
                                  isChecked = newValue!;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'Setuju dengan',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/tnc');
                            },
                            child: const Text(
                              " Syarat & Ketentuan",
                              style: TextStyle(
                                color: Color(0xffA2C90C),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: PrimaryIconButton(
                          title: "Create Account",
                          icon: Icons.person_add,
                          width: 260,
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1540),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFA2C90C),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
