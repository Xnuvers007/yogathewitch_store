import 'package:flutter/material.dart';
import 'package:yogathewitchstore/widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactAdminScreen extends StatelessWidget {
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController tipeController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController serverController = TextEditingController();

  ContactAdminScreen({super.key});

  void _sendWhatsApp(BuildContext context) {
    const String phoneNumber = '6287713944847';
    final String message =
        '> Halo Admin Yogathewitch, saya ingin order dengan format berikut:\n\n'
        '``` \n'
        'Jenis/Nama Pembelian: ${jenisController.text}\n'
        'Beli tipe yang mana: ${tipeController.text}\n'
        'Sebanyak berapa: ${jumlahController.text}\n'
        'ID (Optional): ${idController.text}\n'
        'Server (optional): ${serverController.text}\n'
        '```';

    final Uri url = Uri.parse(
        'https://api.whatsapp.com/send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}');

    _launchURL(url);
  }

  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: jenisController,
              decoration: const InputDecoration(labelText: 'Jenis/Nama Pembelian'),
            ),
            TextField(
              controller: tipeController,
              decoration: const InputDecoration(labelText: 'Beli tipe yang mana'),
            ),
            TextField(
              controller: jumlahController,
              decoration: const InputDecoration(labelText: 'Sebanyak berapa'),
            ),
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID (Optional)'),
            ),
            TextField(
              controller: serverController,
              decoration: const InputDecoration(labelText: 'Server (optional)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _sendWhatsApp(context),
              child: const Text('Kirim ke Admin'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
