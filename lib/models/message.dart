class AtlasMessage {
  final String id;
  final String fromPubkey;
  final String toPubkey;
  final String content;
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
    return AtlasMessage(
      id: event['id'] ?? '',
      fromPubkey: event['pubkey'] ?? '',
      toPubkey: '',
      content: event['content'],
      timestamp: DateTime.now(),
    );
  }
}