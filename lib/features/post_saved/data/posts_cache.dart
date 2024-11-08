import 'package:hive/hive.dart';

part 'posts_cache.g.dart';  // Esto es necesario para generar el adaptador automáticamente

@HiveType(typeId: 0)  // Le damos un ID único al tipo de objeto
class PostsCache {
  @HiveField(0)  // El índice para este campo en la base de datos
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  PostsCache({
    required this.id,
    required this.title,
    required this.body,
  });
}