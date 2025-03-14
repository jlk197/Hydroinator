// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSettingsEntityCollection on Isar {
  IsarCollection<UserSettingsEntity> get userSettingsEntitys =>
      this.collection();
}

const UserSettingsEntitySchema = CollectionSchema(
  name: r'UserSettingsEntity',
  id: 5073917152494840320,
  properties: {
    r'notificationsTime': PropertySchema(
      id: 0,
      name: r'notificationsTime',
      type: IsarType.string,
    )
  },
  estimateSize: _userSettingsEntityEstimateSize,
  serialize: _userSettingsEntitySerialize,
  deserialize: _userSettingsEntityDeserialize,
  deserializeProp: _userSettingsEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userSettingsEntityGetId,
  getLinks: _userSettingsEntityGetLinks,
  attach: _userSettingsEntityAttach,
  version: '3.1.0+1',
);

int _userSettingsEntityEstimateSize(
  UserSettingsEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notificationsTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userSettingsEntitySerialize(
  UserSettingsEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.notificationsTime);
}

UserSettingsEntity _userSettingsEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSettingsEntity(
    notificationsTime: reader.readStringOrNull(offsets[0]),
  );
  object.id = id;
  return object;
}

P _userSettingsEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userSettingsEntityGetId(UserSettingsEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _userSettingsEntityGetLinks(
    UserSettingsEntity object) {
  return [];
}

void _userSettingsEntityAttach(
    IsarCollection<dynamic> col, Id id, UserSettingsEntity object) {
  object.id = id;
}

extension UserSettingsEntityQueryWhereSort
    on QueryBuilder<UserSettingsEntity, UserSettingsEntity, QWhere> {
  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserSettingsEntityQueryWhere
    on QueryBuilder<UserSettingsEntity, UserSettingsEntity, QWhereClause> {
  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterWhereClause>
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

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterWhereClause>
      idBetween(
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

extension UserSettingsEntityQueryFilter
    on QueryBuilder<UserSettingsEntity, UserSettingsEntity, QFilterCondition> {
  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
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

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      idLessThan(
    Id? value, {
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

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notificationsTime',
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notificationsTime',
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationsTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notificationsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notificationsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notificationsTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notificationsTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationsTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterFilterCondition>
      notificationsTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notificationsTime',
        value: '',
      ));
    });
  }
}

extension UserSettingsEntityQueryObject
    on QueryBuilder<UserSettingsEntity, UserSettingsEntity, QFilterCondition> {}

extension UserSettingsEntityQueryLinks
    on QueryBuilder<UserSettingsEntity, UserSettingsEntity, QFilterCondition> {}

extension UserSettingsEntityQuerySortBy
    on QueryBuilder<UserSettingsEntity, UserSettingsEntity, QSortBy> {
  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterSortBy>
      sortByNotificationsTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsTime', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterSortBy>
      sortByNotificationsTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsTime', Sort.desc);
    });
  }
}

extension UserSettingsEntityQuerySortThenBy
    on QueryBuilder<UserSettingsEntity, UserSettingsEntity, QSortThenBy> {
  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterSortBy>
      thenByNotificationsTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsTime', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QAfterSortBy>
      thenByNotificationsTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsTime', Sort.desc);
    });
  }
}

extension UserSettingsEntityQueryWhereDistinct
    on QueryBuilder<UserSettingsEntity, UserSettingsEntity, QDistinct> {
  QueryBuilder<UserSettingsEntity, UserSettingsEntity, QDistinct>
      distinctByNotificationsTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationsTime',
          caseSensitive: caseSensitive);
    });
  }
}

extension UserSettingsEntityQueryProperty
    on QueryBuilder<UserSettingsEntity, UserSettingsEntity, QQueryProperty> {
  QueryBuilder<UserSettingsEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSettingsEntity, String?, QQueryOperations>
      notificationsTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationsTime');
    });
  }
}
