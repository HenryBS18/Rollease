part of 'widgets.dart';

class DateField extends StatefulWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _textEditingController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      radius: 10,
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        controller: _textEditingController,
        textAlignVertical: TextAlignVertical.center,
        onTap: () => _selectDate(context),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: CustomColors.primary)),
          hintText: 'DD/MM/YYYY',
          suffixIcon: Icon(Icons.calendar_today),
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
