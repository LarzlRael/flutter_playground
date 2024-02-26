part of 'pages.dart';

class FormGeneratorPage extends HookWidget {
  const FormGeneratorPage({super.key});
  static const routeName = '/form_generator_page';
  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);

    return GlobalFormScaffold(
      margin: EdgeInsets.symmetric(horizontal: 20),
      iconAppbarSubmit: Icon(Icons.check_circle, color: Colors.green),
      isActionButtonSave: true,
      formTitle: "Agregar cliente",
      /* initialData: customer?.toMap(), */
      fields: customerAddOrEditFields,
      onSubmit: (data) =>
          print("Data: $data"), // Aquí se debe enviar la data al backend
      titleButton: 'Agregar cliente',
      isLoading: isLoading.value,
    );
  }
}
