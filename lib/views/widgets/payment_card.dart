part of 'widgets.dart';

class PaymentCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final Function onTap;

  const PaymentCard({Key? key, required this.title, required this.icon, required this.isActive, required this.onTap})
      : super(key: key);

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  final Color activeColor = const Color(0xffA2C90C);
  final Color inactiveColor = const Color(0xFFF0F8CF);

  Color iconBackgroundColor({required String title, required bool isActive}) {
    if (title == "Debit") {
      if (isActive) {
        return const Color(0xff94AE2F);
      } else {
        return const Color(0xffEBF0D7);
      }
    } else if (title == "OVO") {
      if (isActive) {
        return const Color(0xff94AE2F);
      } else {
        return const Color(0xffEBF0D7);
      }
    } else {
      throw Exception("Invalid title");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Card(
        color: widget.isActive ? activeColor : inactiveColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: SizedBox(
          width: 148,
          height: 148,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 124,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        color: iconBackgroundColor(title: widget.title, isActive: widget.isActive),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                      child: Icon(
                        widget.icon,
                        color: widget.isActive ? Colors.white : const Color(0xff81895F),
                        size: 56,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: widget.isActive ? Colors.white : const Color(0xff81895F),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
