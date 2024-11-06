// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostsCacheAdapter extends TypeAdapter<PostsCache> {
  @override
  final int typeId = 0;

  @override
  PostsCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostsCache(
      id: fields[0] as int,
      title: fields[1] as String,
      body: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PostsCache obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostsCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
