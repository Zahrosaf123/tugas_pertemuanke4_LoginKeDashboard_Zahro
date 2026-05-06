import 'package:flutter/material.dart';

class TambahActivityPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Aktivitas")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Nama Aktivitas",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Simpan"),
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
