import 'package:flutter/material.dart';
import 'tambah_activity_page.dart';
import 'detail_activity_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Data aktivitas sehari-hari
  List<String> activities = [
    "Belajar Codingan",
    "Menulis Catatan",
    "Istirahat",
    "Olahraga Badminton",
    "Beresin Rumah",
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String username = args['username'] ?? "";

    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Hallo, $username 👋",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // judul aktivitas
            Text(
              "Aktivitas Hari Ini",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // ListView (dibungkus Expanded agar tidak error)
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.blue),
                      title: Text(activities[index]),

                      //ke detailnya
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailActivityPage(activity: activities[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            // tombol button kembali
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Kembali ke Home'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),

      // tombol +
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahActivityPage()),
          );

          if (result != null && result != "") {
            setState(() {
              activities.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
