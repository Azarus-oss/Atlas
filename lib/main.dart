import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AtlasApp()));
}

class AtlasApp extends StatelessWidget {
  const AtlasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlas - Décentralisé',
      theme: ThemeData.dark().copyWith(primaryColor: Colors.deepPurple),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const FeedScreen(),
    const GalleryScreen(),
    const ChatScreen(),
    const UploadScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🌐 Atlas • Décentralisé'), actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: () {})]),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Galerie'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_upload), label: 'Upload'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Node'),
        ],
      ),
    );
  }
}

// TODO: implémenter chaque screen avec Nostr + IPFS
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('📰 Feed Nostr (Kind 1 + images IPFS) - Pull depuis tes relays'));
}

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('📸 Photos/Vidéos depuis IPFS CIDs - P2P'));
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('💬 DMs Nostr + groupes'));
}

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Column(children: [
      const Text('📤 Upload → IPFS → Publier CID sur Nostr'),
      ElevatedButton(onPressed: () {}, child: const Text('Choisir Photo/Vidéo + Poster'))
    ]),
  );
};

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('⚙️ Tes Nodes : IPFS local + Relays Nostr personnalisés'));
}
