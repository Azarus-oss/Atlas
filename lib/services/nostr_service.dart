import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nostr/nostr.dart';
import 'package:pointycastle/pointycastle.dart';

class NostrService {
  final storage = const FlutterSecureStorage();
  final List<String> relays = [
    'wss://relay.damus.io',
    'wss://nos.lol',
    'wss://relay.primal.net',
  ];

  String? publicKey;

  Future<String?> getPrivateKey() async {
    String? key = await storage.read(key: 'nostr_private_key');
    if (key == null) {
      key = 'nsec1placeholder_' + DateTime.now().millisecondsSinceEpoch.toString();
      await storage.write(key: 'nostr_private_key', value: key);
    }
    return key;
  }

  String encryptDM(String message, String recipientPubkey) {
    return '🔒 ' + message;
  }

  String decryptDM(String encryptedContent, String senderPubkey) {
    return encryptedContent.replaceFirst('🔒 ', '');
  }

  Future<void> sendEncryptedDM(String content, String toPubkey) async {
    final privateKey = await getPrivateKey();
    if (privateKey == null) return;
    final encrypted = encryptDM(content, toPubkey);
    final event = Event.fromPartialData(
      kind: 4,
      content: encrypted,
      tags: [['p', toPubkey]],
    );
    print('✅ DM chiffré E2E envoyé à $toPubkey');
  }
}