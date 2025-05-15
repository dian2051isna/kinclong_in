import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/homescreen_provider.dart';
import 'profile_screen.dart';
import 'history_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kinclong.in'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai, ${homeProvider.userName}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mau poles sepatu atau tas hari ini?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fitur Utama:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  FeatureTile(
                    icon: Icons.cleaning_services,
                    title: 'Layanan Pembersihan',
                  ),
                  FeatureTile(
                    icon: Icons.local_shipping,
                    title: 'Pick-up & Delivery',
                  ),
                  FeatureTile(
                    icon: Icons.track_changes,
                    title: 'Tracking Status',
                  ),
                  FeatureTile(
                    icon: Icons.camera_alt,
                    title: 'Upload Foto Barang',
                  ),
                  FeatureTile(
                    icon: Icons.account_circle,
                    title: 'Profil & Riwayat',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contenxt) {
                  return const RiwayatLayanan();
                },
              ),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contenxt) {
                  return const MyProfile();
                },
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat Layanan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
    );
  }
}
