part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (_, int index) {
          final item = menuList[index];
          return ListTile(
            leading: Icon(item.icon),
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            onTap: () {
              context.push(item.route);
            },
          );
        },
      ),
    );
  }
}
