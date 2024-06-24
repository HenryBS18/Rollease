// ignore_for_file: use_build_context_synchronously

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
  final ScrollController _scrollController = ScrollController();

  bool isChecked = false;
  bool isFocused = false;
  bool isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNodeName.addListener(_onFocusChange);
    _focusNodeEmail.addListener(_onFocusChange);
    _focusNodePassword.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focusNodeName.hasFocus || _focusNodeEmail.hasFocus || _focusNodePassword.hasFocus;

      if (isFocused) _scrollToEnd();
    });
  }

  void _unfocusAllFields() {
    setState(() {
      _focusNodeName.unfocus();
      _focusNodeEmail.unfocus();
      _focusNodePassword.unfocus();
    });
  }

  @override
  void dispose() {
    _focusNodeName.removeListener(_onFocusChange);
    _focusNodeEmail.removeListener(_onFocusChange);
    _focusNodePassword.removeListener(_onFocusChange);

    _focusNodeName.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();

    nameController.dispose();
    emailController.dispose();
    dateController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _unfocusAllFields();
      },
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 32, right: 32, top: isFocused ? 40 : 48),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      !isFocused
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FadeInUp(
                                    duration: const Duration(milliseconds: 1100),
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
                            )
                          : const SizedBox(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          !isFocused
                              ? FadeInUp(
                                  duration: const Duration(milliseconds: 1300),
                                  child: Image.asset(
                                    'assets/LoginSignup.png',
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: Column(
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
                                    controller: nameController,
                                    focusNode: _focusNodeName,
                                    style: const TextStyle(fontSize: 14),
                                    decoration: InputDecoration(
                                      hintText: 'John Doe',
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
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: Column(
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
                                SizedBox(
                                  height: 54,
                                  child: TextFormField(
                                    controller: emailController,
                                    focusNode: _focusNodeEmail,
                                    style: const TextStyle(fontSize: 14),
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
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Birth Date',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                SizedBox(
                                  height: 54,
                                  child: DateField(dateController: dateController),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                PasswordField(focusNode: _focusNodePassword, passwordController: passwordController),
                              ],
                            ),
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  },
                                  splashColor: CustomColors.primary,
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
                                      color: CustomColors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                              onTap: () async {
                                if (isChecked) {
                                  if (nameController.text.isEmpty ||
                                      emailController.text.isEmpty ||
                                      dateController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Please fill all the field!"),
                                      ),
                                    );
                                    return;
                                  }

                                  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
                                  DateTime birthdate = dateFormat.parseStrict(dateController.text);
                                  String formattedBirthdate = DateFormat("yyyy-MM-ddTHH:mm:ss.sss'Z'").format(birthdate.toUtc());

                                  isLoading = true;
                                  setState(() {});

                                  User? user = await AuthService().register(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    birthdate: DateTime.parse(formattedBirthdate),
                                  );

                                  if (user == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Email already used!"),
                                      ),
                                    );
                                    isLoading = false;
                                    setState(() {});
                                    return;
                                  }

                                  context.read<AuthBloc>().add(AddTokenEvent(token: user.token));
                                  context.read<AuthBloc>().add(FetchUserEvent());

                                  isLoading = false;
                                  setState(() {});
                                  Navigator.pushNamed(context, '/home');
                                  return;
                                }

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.close, size: 32),
                                          ),
                                        ],
                                      ),
                                      content: const Text(
                                        "Setujui syarat dan ketentuan",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                );
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
                                  color: CustomColors.primary,
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
              isLoading
                  ? Positioned.fill(
                      child: Opacity(
                        opacity: 0.75,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                              strokeWidth: 7,
                              strokeAlign: 3,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
