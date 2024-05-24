part of 'widgets.dart';

class DebitPaymentMenu extends StatefulWidget {
  const DebitPaymentMenu({Key? key}) : super(key: key);

  @override
  _DebitPaymentMenuState createState() => _DebitPaymentMenuState();
}

class _DebitPaymentMenuState extends State<DebitPaymentMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddNewDebitCard(),
        const SizedBox(height: 16),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: DebitCard(name: "BCA"),
              );
            },
          ),
        )
      ],
    );
  }
}
