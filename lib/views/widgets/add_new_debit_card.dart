part of 'widgets.dart';

class AddNewDebitCard extends StatelessWidget {
  const AddNewDebitCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffD9ED88),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.43,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Color(0xff81895F),
                  size: 32,
                ),
                Text(
                  "Add new card",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff81895F),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
