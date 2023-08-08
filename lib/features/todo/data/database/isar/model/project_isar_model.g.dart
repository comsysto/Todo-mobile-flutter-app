// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_isar_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetProjectIsarModelCollection on Isar {
  IsarCollection<int, ProjectIsarModel> get projectIsarModels =>
      this.collection();
}

const ProjectIsarModelSchema = IsarCollectionSchema(
  schema:
      '{"name":"ProjectIsarModel","idName":"id","properties":[{"name":"title","type":"String"},{"name":"todoList","type":"ObjectList","target":"TodoItemIsarModel"}]}',
  converter: IsarObjectConverter<int, ProjectIsarModel>(
    serialize: serializeProjectIsarModel,
    deserialize: deserializeProjectIsarModel,
    deserializeProperty: deserializeProjectIsarModelProp,
  ),
  embeddedSchemas: [TodoItemIsarModelSchema],
  //hash: (664475975481442765 * 31 + todoItemIsarModelSchemaHash),
);

@isarProtected
int serializeProjectIsarModel(IsarWriter writer, ProjectIsarModel object) {
  IsarCore.writeString(writer, 1, object.title);
  {
    final list = object.todoList;
    final listWriter = IsarCore.beginList(writer, 2, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeTodoItemIsarModel(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.id;
}

@isarProtected
ProjectIsarModel deserializeProjectIsarModel(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _title;
  _title = IsarCore.readString(reader, 1) ?? '';
  final List<TodoItemIsarModel> _todoList;
  {
    final length = IsarCore.readList(reader, 2, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _todoList = const [];
      } else {
        final list = List<TodoItemIsarModel>.filled(
            length,
            TodoItemIsarModel(
              id: -9223372036854775808,
            ),
            growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = TodoItemIsarModel(
                id: -9223372036854775808,
              );
            } else {
              final embedded = deserializeTodoItemIsarModel(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _todoList = list;
      }
    }
  }
  final object = ProjectIsarModel(
    id: _id,
    title: _title,
    todoList: _todoList,
  );
  return object;
}

@isarProtected
dynamic deserializeProjectIsarModelProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      {
        final length = IsarCore.readList(reader, 2, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const [];
          } else {
            final list = List<TodoItemIsarModel>.filled(
                length,
                TodoItemIsarModel(
                  id: -9223372036854775808,
                ),
                growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = TodoItemIsarModel(
                    id: -9223372036854775808,
                  );
                } else {
                  final embedded = deserializeTodoItemIsarModel(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _ProjectIsarModelUpdate {
  bool call({
    required int id,
    String? title,
  });
}

class _ProjectIsarModelUpdateImpl implements _ProjectIsarModelUpdate {
  const _ProjectIsarModelUpdateImpl(this.collection);

  final IsarCollection<int, ProjectIsarModel> collection;

  @override
  bool call({
    required int id,
    Object? title = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (title != ignore) 1: title as String?,
        }) >
        0;
  }
}

sealed class _ProjectIsarModelUpdateAll {
  int call({
    required List<int> id,
    String? title,
  });
}

class _ProjectIsarModelUpdateAllImpl implements _ProjectIsarModelUpdateAll {
  const _ProjectIsarModelUpdateAllImpl(this.collection);

  final IsarCollection<int, ProjectIsarModel> collection;

  @override
  int call({
    required List<int> id,
    Object? title = ignore,
  }) {
    return collection.updateProperties(id, {
      if (title != ignore) 1: title as String?,
    });
  }
}

extension ProjectIsarModelUpdate on IsarCollection<int, ProjectIsarModel> {
  _ProjectIsarModelUpdate get update => _ProjectIsarModelUpdateImpl(this);

  _ProjectIsarModelUpdateAll get updateAll =>
      _ProjectIsarModelUpdateAllImpl(this);
}

sealed class _ProjectIsarModelQueryUpdate {
  int call({
    String? title,
  });
}

class _ProjectIsarModelQueryUpdateImpl implements _ProjectIsarModelQueryUpdate {
  const _ProjectIsarModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<ProjectIsarModel> query;
  final int? limit;

  @override
  int call({
    Object? title = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (title != ignore) 1: title as String?,
    });
  }
}

extension ProjectIsarModelQueryUpdate on IsarQuery<ProjectIsarModel> {
  _ProjectIsarModelQueryUpdate get updateFirst =>
      _ProjectIsarModelQueryUpdateImpl(this, limit: 1);

  _ProjectIsarModelQueryUpdate get updateAll =>
      _ProjectIsarModelQueryUpdateImpl(this);
}

extension ProjectIsarModelQueryFilter
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QFilterCondition> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      todoListIsEmpty() {
    return not().todoListIsNotEmpty();
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      todoListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 2, value: null),
      );
    });
  }
}

extension ProjectIsarModelQueryObject
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QFilterCondition> {}

extension ProjectIsarModelQuerySortBy
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QSortBy> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy> sortByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy>
      sortByTitleDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension ProjectIsarModelQuerySortThenBy
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QSortThenBy> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy> thenByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy>
      thenByTitleDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension ProjectIsarModelQueryWhereDistinct
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QDistinct> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }
}

extension ProjectIsarModelQueryProperty1
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QProperty> {
  QueryBuilder<ProjectIsarModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<ProjectIsarModel, String, QAfterProperty> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ProjectIsarModel, List<TodoItemIsarModel>, QAfterProperty>
      todoListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension ProjectIsarModelQueryProperty2<R>
    on QueryBuilder<ProjectIsarModel, R, QAfterProperty> {
  QueryBuilder<ProjectIsarModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<ProjectIsarModel, (R, String), QAfterProperty> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ProjectIsarModel, (R, List<TodoItemIsarModel>), QAfterProperty>
      todoListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension ProjectIsarModelQueryProperty3<R1, R2>
    on QueryBuilder<ProjectIsarModel, (R1, R2), QAfterProperty> {
  QueryBuilder<ProjectIsarModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<ProjectIsarModel, (R1, R2, String), QOperations>
      titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ProjectIsarModel, (R1, R2, List<TodoItemIsarModel>), QOperations>
      todoListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}
