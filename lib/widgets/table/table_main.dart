part of './tables.dart';

class TableMain extends HookWidget {
  final List<TableHeader> headerList;
  final List<Map<String, dynamic>> dataList;
  final Function(Map<String, dynamic>)? onTap;

  const TableMain({
    super.key,
    this.onTap,
    required this.headerList,
    required this.dataList,
  });

  void handleActivate(
      ValueNotifier<int?> isActivated, int index, Map<String, dynamic> data) {
    isActivated.value = index;
    if (onTap != null) {
      onTap!(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isActivated = useState<int>(-1);
    if (dataList.isEmpty) {
      return Container();
    }
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return TableCell(
          /* key: Key(dataList[index].data.toString()), */
          onTap: handleActivate,
          header: headerList,
          dataList: dataList[index],
          id: index,
          isSelected: isActivated,
        );
      },
    );
  }
}
