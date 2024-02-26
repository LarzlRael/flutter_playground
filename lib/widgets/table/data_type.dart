part of 'tables.dart';

class DataTypeWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final TableHeader header;
  const DataTypeWidget({super.key, required this.data, required this.header});

  @override
  Widget build(BuildContext context) {
    switch (header.type) {
      case DataType.action:
        return Container(
          child: IconButton(
            icon: header.action!.icon,
            onPressed: () => header.action!.action(context, data),
          ),
        );
      case DataType.networkImg:
        return Container(
          child: CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FadeInImage(
                placeholder: AssetImage(
                  'assets/loadings/hand_bag_loading.gif',
                ),
                image: NetworkImage(data[header.key]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      case DataType.a:
        return Container();
      case DataType.textColor:
        return Container();
      case DataType.date:
        return Container(
          child: Text(converTime(data[header.key])),
        );
      case DataType.actions:
        return Container(
          child: Wrap(
            children: header.actions!
                .map(
                  (e) => IconButton(
                    icon: e.icon,
                    tooltip: e.tooltipLabel,
                    onPressed: () => e.action(context, data),
                  ),
                )
                .toList(),
          ),
        );
      case DataType.textArea:
        /* TODO change this for fold and fold widget */
        return Container(
          child: Text(
            data[header.key].toString().length > 100
                ? data[header.key].toString().substring(0, 100) + '...'
                : data[header.key].toString(),
          ),
        );
      case DataType.list:
        final List<String> list = data[header.key].toString().split(',');
        return Container(
          child: Wrap(
            children: list
                .map(
                  (e) => Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(e.trim().toCapitalize()),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.indigo,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )
                .toList(),
          ),
        );

      case DataType.stringArray:
        return Container();
      default:
        return Container(child: Text(data[header.key].toString()));
    }
  }
}
