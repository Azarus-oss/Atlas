// Modèle pour messages chiffrés E2E
class AtlasMessage {
  final String id;
  final String fromPubkey;
  final String toPubkey;
  final String content; // chiffré pour DMs
  final DateTime timestamp;
  final bool isEncrypted;

  AtlasMessage({
    required this.id,
    required this.fromPubkey,
    required this.toPubkey,
    required this.content,
    required this.timestamp,
    this.isEncrypted = true,
  });

  factory AtlasMessage.fromNostr(dynamic event) {
    // TODO: decrypt NIP-04
    return AtlasMessage(
      id: event['id'],
      fromPubkey: event['pubkey'],
      toPubkey: '',
      content: event['content'],
      timestamp: DateTime.now(),
    );
  }
}