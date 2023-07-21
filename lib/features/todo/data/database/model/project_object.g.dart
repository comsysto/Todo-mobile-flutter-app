// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectObjectAdapter extends TypeAdapter<ProjectObject> {
  @override
  final int typeId = 0;

  @override
  ProjectObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectObject(
      title: fields[0] as String,
      todoList: (fields[1] as List?)?.cast<TodoItemObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProjectObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.todoList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
