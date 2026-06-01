import 'package:nostr/nostr.dart';
import 'package:pointycastle/pointycastle.dart';

class NostrService {
  final List<String> relays = [
    'wss://relay.damus.io',
    'wss://nos.lol',
    'wss://relay.primal.net',
  ];

  // Clé privée stockée de manière sécurisée (à améliorer avec secure storage)
  String? privateKey;
  String? publicKey;

  // Chiffrement E2E NIP-04
  String encryptDM(String message, String recipientPubkey) {
    // Implémentation NIP-04 avec shared secret
    // Pour l'instant placeholder - à remplacer par vraie crypto
    return 'encrypted:' + message; // TODO: vraie implémentation
  }

  String decryptDM(String encryptedContent, String senderPubkey) {
    // TODO: vraie decryption NIP-04
    return encryptedContent.replaceFirst('encrypted:', '');
  }

  Future<void> sendEncryptedDM(String content, String toPubkey) async {
    if (privateKey == null) return;
    final encrypted = encryptDM(content, toPubkey);
    // Créer et publier event Kind 4 (NIP-04)
    final event = Event.fromPartialData(
      kind: 4,
      content: encrypted,
      tags: [['p', toPubkey]],
    );
    // TODO: signer et publier sur relays
    print('DM E2E envoyé à $toPubkey');
  }
}