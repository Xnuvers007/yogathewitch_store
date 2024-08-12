import 'package:flutter/material.dart';
import 'package:yogathewitchstore/widgets/footer.dart';

class GalleryScreen extends StatelessWidget {
  final List<Map<String, String>> images;

  const GalleryScreen({super.key})
      : images = const [
    {'title': 'Alight Motion', 'path': 'assets/AlighMotion.jpg'},
    {'title': 'Bstation', 'path': 'assets/Bstation.jpg'},
    {'title': 'Capcut', 'path': 'assets/Capcut.jpg'},
    {'title': 'Discord', 'path': 'assets/Discord.jpg'},
    {'title': 'Facebook', 'path': 'assets/Facebook.jpg'},
    {'title': 'Free Fire ID', 'path': 'assets/FreeFireID.jpg'},
    {'title': 'Genshin Impact', 'path': 'assets/GenshinImpact.jpg'},
    {'title': 'Instagram', 'path': 'assets/Instagram.jpg'},
    {'title': 'LinkedIn', 'path': 'assets/Linkedin.jpg'},
    {'title': 'MLBB Via ID 1', 'path': 'assets/MlbbViaID1.jpg'},
    {'title': 'MLBB Via ID 2', 'path': 'assets/MlbbViaID2.jpg'},
    {'title': 'Netflix', 'path': 'assets/Netflix.jpg'},
    {'title': 'PUBG', 'path': 'assets/PUBG.jpg'},
    {'title': 'Shopee', 'path': 'assets/Shopee.jpg'},
    {'title': 'Spotify', 'path': 'assets/Spotify.jpg'},
    {'title': 'Threads', 'path': 'assets/Threads.jpg'},
    {'title': 'TikTok', 'path': 'assets/Tiktok.jpg'},
    {'title': 'Valorant', 'path': 'assets/Valorant.jpg'},
    {'title': 'X/Twitter', 'path': 'assets/XTwitter.jpg'},
    // {'title': 'Yogathewitch', 'path': 'assets/Yogathewitch.jpg'},
    {'title': 'YouTube', 'path': 'assets/Youtube.jpg'},
    {'title': 'Zoom', 'path': 'assets/Zoom.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yogathewitch Store'),
      ),
      body: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                images[index]['title']!,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(images[index]['path']!),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: const Text('Contact Admin'),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
