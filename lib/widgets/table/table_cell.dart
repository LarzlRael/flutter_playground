part of 'tables.dart';

class TableCell extends StatelessWidget {
  final Map<String, dynamic> dataList;
  final List<TableHeader> header;
  final Function(
    ValueNotifier<int?> isActivated,
    int index,
    Map<String, dynamic> data,
  )? onTap;
  final int id;
  final ValueNotifier<int?> isSelected;

/* void handleActivate(
  ValueNotifier<int?> isActivated,
  int index,
  Map<String, dynamic> data,
) */
  const TableCell({
    super.key,
    this.onTap,
    required this.id,
    required this.isSelected,
    required this.dataList,
    required this.header,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      decoration: BoxDecoration(
        color: isSelected.value == id ? Colors.blue : null,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: header
            .map((e) => InkWell(
                  onTap: () {
                    if (onTap != null || e.type != DataType.action) {
                      onTap!(isSelected, id, dataList);
                    }
                  },
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "${e.name}: ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DataTypeWidget(data: dataList, header: e)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
