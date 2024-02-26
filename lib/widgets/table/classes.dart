part of './tables.dart';

class TableHeader {
  String name;
  String key;
  Action? action;
  List<Action>? actions;
  TableHeader({
    required this.name,
    required this.key,
    this.type,
    this.action,
    this.actions,
  });
  DataType? type;
}

enum DataType {
  action,
  img,
  networkImg,
  a,
  textColor,
  date,
  actions,
  textArea,
  list,
  stringArray,
}

enum TypeActionButton {
  icon_button,
  filled_button,
}

class Action {
  String tooltipLabel;
  Icon icon;
  TypeActionButton? typeActionButton;
  Function(BuildContext context, Map<String, dynamic> data) action;

  Action({
    required this.tooltipLabel,
    required this.icon,
    required this.action,
    this.typeActionButton = TypeActionButton.icon_button,
  });
}

class TableData {
  Map<String, dynamic> data;

  TableData({
    required this.data,
  });
}

List<TableHeader> listHeader = <TableHeader>[
  TableHeader(name: 'Name', key: 'name'),
  TableHeader(name: 'Age', key: 'age'),
  TableHeader(name: 'Address', key: 'address'),
  TableHeader(name: 'Listadp', key: 'list', type: DataType.list),
  TableHeader(
      name: 'Action',
      key: 'action',
      type: DataType.action,
      action: Action(
        tooltipLabel: 'Action',
        icon: Icon(Icons.check_circle),
        action: (context, data) {
          print(data);
        },
      )),
  TableHeader(name: 'Imagen', key: 'test_image', type: DataType.networkImg),
  TableHeader(name: 'Fecha ', key: 'date', type: DataType.date),
  TableHeader(name: 'Informacion ', key: 'info', type: DataType.textArea),
  TableHeader(
    name: 'Actions',
    key: 'actions',
    type: DataType.actions,
    actions: [
      Action(
        tooltipLabel: 'Action',
        icon: Icon(Icons.check_circle),
        action: (context, data) {
          print(data);
        },
      ),
      Action(
        tooltipLabel: 'Action',
        icon: Icon(Icons.abc),
        action: (context, data) {
          print(data);
        },
      ),
    ],
  ),
];
