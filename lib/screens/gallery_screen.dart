import 'package:flutter/material.dart';
import 'package:yogathewitchstore/widgets/footer.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  GalleryScreenState createState() => GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen> {
  final List<Map<String, String>> allImages = const [
    {'title': 'Alight Motion', 'path': 'assets/AlighMotion.jpg'},
    {'title': 'Bstation', 'path': 'assets/Bstation.jpg'},
    {'title': 'Capcut', 'path': 'assets/Capcut.jpg'},
    {'title': 'Discord', 'path': 'assets/Discord.jpg'},
    {'title': 'Facebook', 'path': 'assets/Facebook.jpg'},
    {'title': 'Free Fire ID', 'path': 'assets/FreeFireID.jpg'},
    {'title': 'Genshin Impact', 'path': 'assets/GenshinImpact.jpg'},
    {'title': 'Instagram', 'path': 'assets/Instagram.jpg'},
    {'title': 'Jasa Joki Tugas', 'path': 'assets/sora007.jpg'},
    {'title': 'Jasa Service Device', 'path': 'assets/deni.jpg'},
    {'title': 'Jasa Service Rumah', 'path': 'assets/JasaServiceRumah.jpg'},
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
    {'title': 'YouTube', 'path': 'assets/Youtube.jpg'},
    {'title': 'Zoom', 'path': 'assets/Zoom.jpg'},
  ];

  String selectedLetter = 'All';
  List<Map<String, String>> filteredImages = [];

  @override
  void initState() {
    super.initState();
    filteredImages = allImages;
  }

  void filterByLetter(String letter) {
    setState(() {
      selectedLetter = letter;
      if (letter == 'All') {
        filteredImages = allImages;
      } else {
        filteredImages = allImages
            .where((image) => image['title']!.startsWith(letter))
            .toList();
      }
    });
  }

  String getPreviousLetter(String currentLetter) {
    if (currentLetter == 'All') {
      return 'Z';
    } else if (currentLetter == 'A') {
      return 'Z';
    } else {
      return String.fromCharCode(currentLetter.codeUnitAt(0) - 1);
    }
  }

  String getNextLetter(String currentLetter) {
    if (currentLetter == 'Z') {
      return 'A';
    } else if (currentLetter == 'All') {
      return 'A';
    } else {
      return String.fromCharCode(currentLetter.codeUnitAt(0) + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yogathewitch Store'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_left),
                  onPressed: () {
                    filterByLetter(getPreviousLetter(selectedLetter));
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 27, // 26 letters + 'All'
                    itemBuilder: (context, index) {
                      String letter = index == 0 ? 'All' : String.fromCharCode(64 + index);
                      bool isSelected = letter == selectedLetter;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected ? Colors.blue : Colors.grey, // Background color
                            foregroundColor: isSelected ? Colors.white : Colors.black, // Text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () => filterByLetter(letter),
                          child: Text(letter),
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {
                    filterByLetter(getNextLetter(selectedLetter));
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: filteredImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        filteredImages[index]['title']!,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: InteractiveViewer(
                          boundaryMargin: const EdgeInsets.all(20.0),
                          minScale: 0.5,
                          maxScale: 3.0,
                          child: Image.asset(filteredImages[index]['path']!),
                        ),
                      ),
                      const SizedBox(height: 22),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/contact');
                        },
                        child: const Text('Contact Admin'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
