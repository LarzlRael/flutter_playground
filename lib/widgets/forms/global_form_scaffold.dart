part of 'forms.dart';

class GlobalFormScaffold extends HookWidget {
  final List<Field> fields;
  final Map<String, dynamic>? initialData;
  final Function(Map<String, dynamic> data) onSubmit;
  final String? formTitle;
  final bool? isLoading;
  final String? titleButton;
  final bool? isActionButtonSave;
  final Widget? firstWidget;
  final Widget? lastWidget;
  final EdgeInsets? margin;
  final Icon? iconAppbarSubmit;
  GlobalFormScaffold({
    required this.fields,
    required this.onSubmit,
    this.formTitle,
    this.initialData,
    this.isLoading = false,
    this.titleButton = "Guardar",
    this.isActionButtonSave = false,
    this.firstWidget,
    this.lastWidget,
    this.margin,
    this.iconAppbarSubmit,
  });

  final _formKey = GlobalKey<FormBuilderState>();

  Map<String, dynamic> generateInitialValues() {
    Map<String, dynamic> initialValues = {};
    fields.forEach((i) {
      initialValues = {
        ...initialValues,
        i.nameField: initialData?[i.nameField] ?? i.initialValue,
      };
    });
    return initialValues;
  }

  void _onSubmit(
    GlobalKey<FormBuilderState> _formKey,
    ValueNotifier<List<String>> selectedImages,
  ) {
    if (!_formKey.currentState!.validate()) return;

    final data = _formKey.currentState!.fields
        .map((key, value) => MapEntry(key, value.value));
    if (selectedImages.value.isNotEmpty) {
      data['images'] = selectedImages.value;
    }
    onSubmit(data);
  }

  @override
  Widget build(BuildContext context) {
    final selectedImages = useState<List<String>>([
      ...initialData?['images'] ?? [],
    ]);
    useEffect(() {
      selectedImages.value = initialData?['files'] ?? [];
      return () {};
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: Text(formTitle ?? "Formulario"),
        actions: [
          if (isActionButtonSave!)
            IconButton(
                onPressed: () => _onSubmit(_formKey, selectedImages),
                icon: iconAppbarSubmit ??
                    Icon(
                      Icons.save,
                      color: Colors.green,
                    )),
        ],
      ),
      body: Container(
        margin: margin ?? EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              firstWidget != null ? firstWidget! : SizedBox(),
              FormBuilder(
                key: _formKey,
                initialValue: generateInitialValues(),
                child: Column(
                  children: [
                    Column(
                      children: fields.map((field) {
                        if (field.typeField == TypeField.text ||
                            field.typeField == TypeField.email ||
                            field.typeField == TypeField.password) {
                          return CustomInput(
                            nameField: field.nameField,
                            icon: field.icon,
                            placeholder: field.placeholder,
                            isPassword: field.isPassword,
                            keyboardType: field.keyboardType,
                            validator: field.validator,
                          );
                        }
                        if (field.typeField == TypeField.number) {
                          return CustomInput(
                            nameField: field.nameField,
                            icon: field.icon,
                            placeholder: field.placeholder,
                            isPassword: field.isPassword,
                            keyboardType: field.keyboardType,
                            validator: field.validator,
                          );
                        }
                        if (field.typeField == TypeField.textArea) {
                          return CustomFormBuilderTextArea(
                            nameField: field.nameField,
                            placeholder: field.placeholder,
                            validator: field.validator,
                            /* icon: field.icon!, */
                            keyboardType: field.keyboardType,
                            suffixAction: field.suffixAction,
                            suffixIcon: field.suffixIcon,
                          );
                        }
                        if (field.typeField == TypeField.switchField) {
                          return CustomSwitch(
                            nameField: field.nameField,
                            /* validator: field.validator, */
                            /* icon: field.icon!, */
                            placeholder: field.placeholder,
                          );
                        }
                        if (field.typeField == TypeField.dropdown) {
                          return CustomDropdown(
                            nameField: field.nameField,
                            placeholder: field.placeholder,
                            options: field.options!,
                          );
                        }
                        if (field.typeField == TypeField.file) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: FilePicker(
                              nameField: field.nameField,
                              initialValue: selectedImages.value,
                              onSelectedFiles: (List<String>? files) {
                                selectedImages.value = files ?? [];
                              },
                              onRemoveImage: (file) {
                                selectedImages.value = selectedImages.value
                                    .where((element) => element != file)
                                    .toList();
                              },
                              takePhoto: (String? photo) {
                                selectedImages.value = [photo ?? ''];
                              },
                            ),
                          );
                        }

                        return Container();
                      }).toList(),
                    ),
                    isActionButtonSave != null && isActionButtonSave!
                        ? SizedBox()
                        : SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ButtonWithIcon(
                              icon: Icons.save,
                              label: titleButton ?? "Guardar",
                              onPressed: () => _onSubmit(
                                _formKey,
                                selectedImages,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              lastWidget != null ? lastWidget! : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
