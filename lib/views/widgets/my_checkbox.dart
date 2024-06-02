part of 'widgets.dart';

class MyCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool? value) onChanged;

  const MyCheckbox({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.47,
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          const Text(
            "Don't show again",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
