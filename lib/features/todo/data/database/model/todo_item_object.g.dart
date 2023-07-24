// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoItemObjectAdapter extends TypeAdapter<TodoItemObject> {
  @override
  final int typeId = 1;

  @override
  TodoItemObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoItemObject(
      title: fields[1] as String,
      dueDate: fields[2] as DateTime?,
      id: fields[0] as int?,
      isDone: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoItemObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.dueDate)
      ..writeByte(3)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItemObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
