part of './forms.dart';

class CustomDatePicker extends StatelessWidget {
  final String name;

  final String placeholder;
  final TextInputType keyboardType;
  final IconData suffixIcon;
  final String? Function(DateTime?)? validator;

  const CustomDatePicker({
    Key? key,
    required this.name,
    required this.placeholder,
    required this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 5, bottom: 0, right: 20),
      margin: EdgeInsets.only(bottom: 15),
      child: FormBuilderDateTimePicker(
        onChanged: (value) {
          print(value);
        },
        name: name,
        fieldHintText: placeholder,
        validator: validator,
        decoration: InputDecoration(
          border: outlineInputBorder,
          label: Text(placeholder),
          prefixIcon: Icon(
            Icons.calendar_today,
          ),
        ),
      ),
    );
  }
}
