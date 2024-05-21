part of 'pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: const Text(
                  "Welcome Back!!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FadeInUp(
                duration: Duration(milliseconds: 1200),
                child: Text(
                  "Silahkan masuk menggunakan akun yang telah didaftar.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 30),
              FadeInUp(
                duration: Duration(milliseconds: 1300),
                child: Image.asset(
                  'icon5.png',
                  height: 150,
                ),
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Alamat Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'emailanda@gmail.com',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'Kata Sandi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '**********',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              FadeInUp(
                duration: Duration(milliseconds: 1400),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    MaterialButton(
                      height: 45,
                      minWidth: 169,
                      onPressed: () {
                        RateApp.showFeedbackBottomSheet(
                          context: context,
                        );
                      },
                      color: Color(0xFFA2C90C),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Text(
                        "Login",
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
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFA2C90C),
                        ),
                        padding: EdgeInsets.all(8),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              FadeInUp(
                duration: Duration(milliseconds: 1500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xFFA2C90C),
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
    );
  }
}
