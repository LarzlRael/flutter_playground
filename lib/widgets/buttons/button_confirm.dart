part of 'buttons.dart';

class ButtonConfirm extends StatelessWidget {
  final String textConfirm;
  final String textCancel;
  final Future<bool> Function()? onAccept;
  final Future<bool> Function()? onReject;
  const ButtonConfirm({
    Key? key,
    this.textConfirm = 'Confirmar',
    this.textCancel = 'Cancelar',
    required this.onAccept,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FillButton(
            borderRadius: 5,
            label: "Rechazar",
            ghostButton: true,
            onPressed: () async {
              await onReject!();
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FillButton(
            borderRadius: 5,
            label: "Aceptar",
            onPressed: () {
              if (onAccept != null) {
                onAccept!();
              }
            },
          ),
        )
      ],
    );
  }
}
