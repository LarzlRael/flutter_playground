part of 'pages.dart';

class TableGeneratorPage extends StatelessWidget {
  static const routeName = '/table_generator_page';
  const TableGeneratorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Table'),
      ),
      body: Container(
        child: TableMain(
          headerList: listHeader,
          dataList: [
            {
              'name': 'John',
              'age': 20,
              'address': 'New York No. 1 Lake Park',
              'test_image':
                  'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
              'date': DateTime.now(),
              'info':
                  'There will be no 32bit ISO from Series 4.x onwards. If you still need to run a 32bit operating system, our Series 3.x is supported until April, 2021. Download it from here (wait for page to load and choose your nearest location).',
              'list': 'azul, negro, amarillo, blanco'
            },
            {
              'name': 'John',
              'age': 20,
              'address': 'New York No. 1 Lake Park',
              'test_image':
                  'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
              'date': DateTime.now(),
              'info':
                  'There will be no 32bit ISO from Series 4.x onwards. If you still need to run a 32bit operating system, our Series 3.x is supported until April, 2021. Download it from here (wait for page to load and choose your nearest location).',
              'list': 'azul, negro, amarillo, blanco'
            },
            {
              'name': 'John',
              'age': 20,
              'address': 'New York No. 1 Lake Park',
              'test_image':
                  'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
              'date': DateTime.now(),
              'info':
                  'There will be no 32bit ISO from Series 4.x onwards. If you still need to run a 32bit operating system, our Series 3.x is supported until April, 2021. Download it from here (wait for page to load and choose your nearest location).',
              'list': 'azul, negro, amarillo, blanco'
            },
            {
              'name': 'John',
              'age': 20,
              'address': 'New York No. 1 Lake Park',
              'test_image':
                  'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
            },
            {
              'name': 'John',
              'age': 20,
              'address': 'New York No. 1 Lake Park',
              'test_image':
                  'https://cdn.pixabay.com/photo/2014/06/03/19/38/board-361516_640.jpg',
              'date': DateTime.now(),
              'info':
                  'There will be no 32bit ISO from Series 4.x onwards. If you still need to run a 32bit operating system, our Series 3.x is supported until April, 2021. Download it from here (wait for page to load and choose your nearest location).',
              'list': 'azul, negro, amarillo, blanco'
            },
          ],
          onTap: (data) => {print(data)},
        ),
      ),
    );
  }
}
