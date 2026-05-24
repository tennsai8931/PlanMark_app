import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PointPage extends StatefulWidget {
  const PointPage({super.key});

  @override
  State<PointPage> createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  List points = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadPoints();
  }

  Future<void> loadPoints() async {
    setState(() {
      isLoading = true;
    });

    final data = await ApiService.getPoints();

    setState(() {
      points = data;
      isLoading = false;
    });
  }

  Future<void> addTestPoint() async {
    await ApiService.createPoint(
      name: 'Flutter登録地点',
      x: 300,
      y: 400,
      note: 'FlutterからPOST',
    );

    await loadPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTestPoint,
        child: const Icon(Icons.add),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: points.length,
              itemBuilder: (context, index) {
                final point = points[index];

                return ListTile(
                  title: Text(point['name'] ?? 'No Name'),
                  subtitle: Text(
                    'X:${point['x']} Y:${point['y']}',
                  ),
                );
              },
            ),
    );
  }
}