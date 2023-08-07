// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectHiveModelAdapter extends TypeAdapter<ProjectHiveModel> {
  @override
  final int typeId = 0;

  @override
  ProjectHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectHiveModel(
      title: fields[0] as String,
      todoList: (fields[1] as List).cast<TodoItemHiveModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProjectHiveModel obj) {
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
      other is ProjectHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
