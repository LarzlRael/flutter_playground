part of 'forms.dart';

class CustomInput extends HookWidget {
  final IconData? icon;
  final String? placeholder;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool clearText;
  final String nameField;
  final String? Function(String?)? validator;
  final IconButton? suffixIconOnPressed;

  const CustomInput({
    required this.nameField,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.placeholder,
    this.isPassword = false,
    this.clearText = false,
    this.validator,
    this.suffixIconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      /*
      decoration: boxDecorationField, */
      child: FormBuilderField(
        name: nameField,
        builder: (FormFieldState<String?> field) {
          return TextFormField(
            textCapitalization: TextCapitalization.sentences,
            initialValue: field.value,
            obscureText: isPassword && obscureText.value,
            keyboardType: keyboardType,
            validator: validator,
            onChanged: (value) => field.didChange(value),
            decoration: InputDecoration(
              label: placeholder == null
                  ? null
                  : Text(
                      placeholder!,
                      style: placeHolderStyle,
                    ),
              border: outlineInputBorder,
              prefixIcon: Icon(icon),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: obscureText.value
                          ? Icon(Icons.password)
                          : Icon(Icons.remove_red_eye_outlined),
                      onPressed: () => obscureText.value = !obscureText.value,
                    )
                  : suffixIconOnPressed == null
                      ? null
                      : suffixIconOnPressed,
              labelStyle: TextStyle(fontSize: 15),
              /* hintText: placeholder, */
            ),
          );
        },
        /* obscureText: isPassword && obscureText.value,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          label: placeholder == null
              ? null
              : Text(
                  placeholder!,
                  style: TextStyle(color: colors.primary, fontSize: 14),
                ),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: colors.primary),
          ),
          prefixIcon: Icon(icon),
          suffixIcon: isPassword
              ? IconButton(
                  icon: obscureText.value
                      ? Icon(Icons.password)
                      : Icon(Icons.remove_red_eye_outlined),
                  onPressed: () => obscureText.value = !obscureText.value,
                )
              : suffixIconOnPressed == null
                  ? null
                  : suffixIconOnPressed,
          labelStyle: TextStyle(fontSize: 15),
          /* hintText: placeholder, */
        ), */
      ),
    );
  }
}
