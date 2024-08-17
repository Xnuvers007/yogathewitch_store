import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yogathewitchstore/widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactAdminScreen extends StatefulWidget {
  const ContactAdminScreen({super.key});

  @override
  ContactAdminScreenState createState() => ContactAdminScreenState();
}

class ContactAdminScreenState extends State<ContactAdminScreen> {
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController tipeController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController serverController = TextEditingController();

  String selectedAdmin = 'Admin 1';
  String selectedPembayaran = 'Qris'; // Default payment method
  bool isLoading = false;

  final Map<String, String> adminContacts = {
    'Admin 1': '6287713944847',
    'Admin 2': '6285892838935',
  };

  final List<String> pembayaranOptions = ['Qris', 'Dana', 'Gopay', 'Bank Transfer'];

  void _sendWhatsApp() async {
    final String message =
        '> Halo Admin Yogathewitch, saya ingin order dengan format berikut:\n\n'
        '``` \n'
        'Category: ${jenisController.text}\n'
        'Type: ${tipeController.text}\n'
        'Qty: ${jumlahController.text}\n'
        'ID (Optional): ${idController.text}\n'
        'Server (optional): ${serverController.text}\n'
        'Pembayaran: $selectedPembayaran\n'
        '```';

    final String selectedPhoneNumber = adminContacts[selectedAdmin]!;
    final Uri url = Uri.parse(
        'https://api.whatsapp.com/send?phone=$selectedPhoneNumber&text=${Uri.encodeComponent(message)}');

    setState(() {
      isLoading = true;
    });

    try {
      await _launchURL(url);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal membuka WhatsApp')),
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
    final String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());
    final String formattedTime = DateFormat('HH:mm').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Admin'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tanggal: $formattedDate', style: const TextStyle(fontSize: 16)),
              Text('Waktu: $formattedTime', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text('Payment Methods:'),
              DropdownButton<String>(
                value: selectedPembayaran,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPembayaran = newValue!;
                  });
                },
                items: pembayaranOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: jenisController,
                decoration: const InputDecoration(labelText: 'Category: '),
              ),
              TextField(
                controller: tipeController,
                decoration: const InputDecoration(labelText: 'Type: '),
              ),
              TextField(
                controller: jumlahController,
                decoration: const InputDecoration(labelText: 'Qty: '),
              ),
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'ID (Optional)'),
              ),
              TextField(
                controller: serverController,
                decoration: const InputDecoration(labelText: 'Server (Optional)'),
              ),
              const SizedBox(height: 20),
              const Text('Admin Contact:'),
              Center(
                child: DropdownButton<String>(
                  value: selectedAdmin,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedAdmin = newValue!;
                    });
                  },
                  items: adminContacts.keys.map<DropdownMenuItem<String>>((String key) {
                    return DropdownMenuItem<String>(
                      value: key,
                      child: Text(key),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: _sendWhatsApp,
                  child: const Text('Kirim ke Admin'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
