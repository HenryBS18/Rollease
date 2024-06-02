part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNodeEmail.addListener(_onFocusChange);
    _focusNodePassword.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focusNodeEmail.hasFocus || _focusNodePassword.hasFocus;
    });
  }

  void _unfocusAllFields() {
    _focusNodeEmail.unfocus();
    _focusNodePassword.unfocus();
  }

  @override
  void dispose() {
    _focusNodeEmail.removeListener(_onFocusChange);
    _focusNodePassword.removeListener(_onFocusChange);
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
          padding: const EdgeInsets.only(left: 32, right: 32, top: 76),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          "Welcome Back!!",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1200),
                        child: Text(
                          "Silahkan masuk menggunakan akun yang telah didaftar.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    !isFocused
                        ? FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: Image.asset(
                              'assets/Login Image.png',
                              width: 300,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    TextFormField(
                      focusNode: _focusNodeEmail,
                      decoration: InputDecoration(
                        hintText: 'henry@gmail.com',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: CustomColors.primary,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    PasswordField(focusNode: _focusNodePassword),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 1400),
                      child: PrimaryIconButton(
                        title: "Login",
                        icon: Icons.login,
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: CustomColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
