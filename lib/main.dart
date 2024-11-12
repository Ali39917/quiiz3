import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar with ListView and GridView'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'List View'),
              Tab(text: 'Grid View'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListViewTab(),
            GridViewTab(),
          ],
        ),
      ),
    );
  }
}

class ListViewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.label),
          title: Text('Item ${index + 1}'),
          subtitle: Text('Subtitle ${index + 1}'),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Tapped on Item ${index + 1}'),
              ),
            );
          },
        );
      },
    );
  }
}

class GridViewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      padding: EdgeInsets.all(8.0),
      itemCount: 20,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Tapped on Grid ${index + 1}'),
              ),
            );
          },
          child: Card(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.widgets, size: 40),
                  SizedBox(height: 8.0),
                  Text('Grid ${index + 1}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}