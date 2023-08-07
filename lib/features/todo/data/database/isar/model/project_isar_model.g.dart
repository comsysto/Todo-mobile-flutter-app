// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProjectIsarModelCollection on Isar {
  IsarCollection<ProjectIsarModel> get projectIsarModels => this.collection();
}

const ProjectIsarModelSchema = CollectionSchema(
  name: r'ProjectIsarModel',
  id: -1254447405627766126,
  properties: {
    r'title': PropertySchema(
      id: 0,
      name: r'title',
      type: IsarType.string,
    ),
    r'todoItems': PropertySchema(
      id: 1,
      name: r'todoItems',
      type: IsarType.objectList,
      target: r'TodoItemIsarModel',
    )
  },
  estimateSize: _projectIsarModelEstimateSize,
  serialize: _projectIsarModelSerialize,
  deserialize: _projectIsarModelDeserialize,
  deserializeProp: _projectIsarModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'TodoItemIsarModel': TodoItemIsarModelSchema},
  getId: _projectIsarModelGetId,
  getLinks: _projectIsarModelGetLinks,
  attach: _projectIsarModelAttach,
  version: '3.1.0+1',
);

int _projectIsarModelEstimateSize(
  ProjectIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.todoItems.length * 3;
  {
    final offsets = allOffsets[TodoItemIsarModel]!;
    for (var i = 0; i < object.todoItems.length; i++) {
      final value = object.todoItems[i];
      bytesCount +=
          TodoItemIsarModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _projectIsarModelSerialize(
  ProjectIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.title);
  writer.writeObjectList<TodoItemIsarModel>(
    offsets[1],
    allOffsets,
    TodoItemIsarModelSchema.serialize,
    object.todoItems,
  );
}

ProjectIsarModel _projectIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProjectIsarModel(
    title: reader.readString(offsets[0]),
    todoItems: reader.readObjectList<TodoItemIsarModel>(
          offsets[1],
          TodoItemIsarModelSchema.deserialize,
          allOffsets,
          TodoItemIsarModel(),
        ) ??
        const [],
  );
  return object;
}

P _projectIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectList<TodoItemIsarModel>(
            offset,
            TodoItemIsarModelSchema.deserialize,
            allOffsets,
            TodoItemIsarModel(),
          ) ??
          const []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _projectIsarModelGetId(ProjectIsarModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _projectIsarModelGetLinks(ProjectIsarModel object) {
  return [];
}

void _projectIsarModelAttach(
    IsarCollection<dynamic> col, Id id, ProjectIsarModel object) {}

extension ProjectIsarModelQueryWhereSort
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QWhere> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProjectIsarModelQueryWhere
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QWhereClause> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProjectIsarModelQueryFilter
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QFilterCondition> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      todoItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'todoItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      todoItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'todoItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      todoItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'todoItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      todoItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'todoItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      todoItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'todoItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      todoItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'todoItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ProjectIsarModelQueryObject
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QFilterCondition> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterFilterCondition>
      todoItemsElement(FilterQuery<TodoItemIsarModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'todoItems');
    });
  }
}

extension ProjectIsarModelQueryLinks
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QFilterCondition> {}

extension ProjectIsarModelQuerySortBy
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QSortBy> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ProjectIsarModelQuerySortThenBy
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QSortThenBy> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ProjectIsarModelQueryWhereDistinct
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QDistinct> {
  QueryBuilder<ProjectIsarModel, ProjectIsarModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension ProjectIsarModelQueryProperty
    on QueryBuilder<ProjectIsarModel, ProjectIsarModel, QQueryProperty> {
  QueryBuilder<ProjectIsarModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProjectIsarModel, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ProjectIsarModel, List<TodoItemIsarModel>, QQueryOperations>
      todoItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todoItems');
    });
  }
}
