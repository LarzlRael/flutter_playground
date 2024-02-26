import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:templat_project/widgets/forms/forms.dart';

final customerAddOrEditFields = <Field>[
  Field(
    nameField: "name",
    typeField: TypeField.text,
    icon: Icons.person,
    placeholder: "Nombre del cliente",
    validator: FormBuilderValidators.required(),
  ),
  Field(
    nameField: "phoneNumber",
    typeField: TypeField.number,
    placeholder: "Telefono",
    icon: Icons.phone,
  ),
  Field(
    nameField: "urlFacebookProfile",
    typeField: TypeField.text,
    placeholder: "Url de perfil de facebook",
    validator: FormBuilderValidators.url(),
    icon: Icons.facebook,
  ),
  Field(
    nameField: "notes",
    typeField: TypeField.textArea,
    placeholder: "Notas",
  ),
];
