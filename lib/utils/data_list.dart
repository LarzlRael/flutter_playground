part of 'utils.dart';

class MenuListItem {
  final String title;
  final IconData icon;
  final String route;
  final String subtitle;
  const MenuListItem({
    required this.title,
    required this.icon,
    required this.route,
    required this.subtitle,
  });
}

final List<MenuListItem> menuList = [
  MenuListItem(
    title: 'Form Generator',
    icon: Icons.list,
    route: FormGeneratorPage.routeName,
    subtitle: 'Form Generator Page',
  ),
  MenuListItem(
    title: 'Data Table',
    icon: Icons.table_chart,
    route: TableGeneratorPage.routeName,
    subtitle: 'Data Table Page',
  ),
];
