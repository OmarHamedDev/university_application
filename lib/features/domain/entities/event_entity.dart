class EventEntity {
  final int id;
  final String title;
  final String content;
  final String createdAt;
  final String updatedAt;
  final String image;
  EventEntity({
    required this.id,
    required this.title,
   required this.image,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
}
