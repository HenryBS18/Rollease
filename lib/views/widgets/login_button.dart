part of 'widgets.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 1400),
      child: GestureDetector(
        child: Container(
          width: 180,
          height: 56,
          decoration: BoxDecoration(
            color: Color(0xffA2C90C),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.login,
                size: 32,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
