part of 'forms.dart';

class CustomFormBuilderTextArea extends HookWidget {
  final String nameField;
  final IconData? icon;
  final String? Function(String?)? validator;

  final String? placeholder;
  final TextInputType keyboardType;
  final Function(BuildContext context, FormFieldState<String> field)?
      suffixAction;
  final IconData? suffixIcon;

  CustomFormBuilderTextArea({
    Key? key,
    this.icon,
    this.suffixAction,
    this.placeholder,
    this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required this.nameField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FormBuilderField(
        name: nameField,
        builder: (FormFieldState<String> field) {
          return TextFormField(
            initialValue: field.value,
            keyboardType: keyboardType,
            validator: validator,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 5,
            onChanged: (value) => field.didChange(value),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              suffixIcon: suffixAction == null
                  ? SizedBox()
                  : field.value != null
                      ? IconButton(
                          icon: Icon(suffixIcon ?? Icons.send),
                          onPressed: () {
                            if (suffixAction != null) {
                              suffixAction!(context, field);
                            }
                          })
                      : SizedBox(),
              border: outlineInputBorder,
              label: placeholder == null
                  ? null
                  : Text(
                      placeholder!,
                      style: placeHolderStyle,
                    ),
            ),
          );
        },
      ),
    );
  }
}
