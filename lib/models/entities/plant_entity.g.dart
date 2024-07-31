// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlantEntityCollection on Isar {
  IsarCollection<PlantEntity> get plantEntitys => this.collection();
}

const PlantEntitySchema = CollectionSchema(
  name: r'PlantEntity',
  id: -8929794816181339717,
  properties: {
    r'addDate': PropertySchema(
      id: 0,
      name: r'addDate',
      type: IsarType.dateTime,
    ),
    r'dayInterval': PropertySchema(
      id: 1,
      name: r'dayInterval',
      type: IsarType.long,
    ),
    r'deathDate': PropertySchema(
      id: 2,
      name: r'deathDate',
      type: IsarType.dateTime,
    ),
    r'imagesFiles': PropertySchema(
      id: 3,
      name: r'imagesFiles',
      type: IsarType.objectList,
      target: r'ImageEntity',
    ),
    r'isAlive': PropertySchema(
      id: 4,
      name: r'isAlive',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 6,
      name: r'startDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _plantEntityEstimateSize,
  serialize: _plantEntitySerialize,
  deserialize: _plantEntityDeserialize,
  deserializeProp: _plantEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ImageEntity': ImageEntitySchema},
  getId: _plantEntityGetId,
  getLinks: _plantEntityGetLinks,
  attach: _plantEntityAttach,
  version: '3.1.0+1',
);

int _plantEntityEstimateSize(
  PlantEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imagesFiles.length * 3;
  {
    final offsets = allOffsets[ImageEntity]!;
    for (var i = 0; i < object.imagesFiles.length; i++) {
      final value = object.imagesFiles[i];
      bytesCount += ImageEntitySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _plantEntitySerialize(
  PlantEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.addDate);
  writer.writeLong(offsets[1], object.dayInterval);
  writer.writeDateTime(offsets[2], object.deathDate);
  writer.writeObjectList<ImageEntity>(
    offsets[3],
    allOffsets,
    ImageEntitySchema.serialize,
    object.imagesFiles,
  );
  writer.writeBool(offsets[4], object.isAlive);
  writer.writeString(offsets[5], object.name);
  writer.writeDateTime(offsets[6], object.startDate);
}

PlantEntity _plantEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlantEntity(
    addDate: reader.readDateTime(offsets[0]),
    dayInterval: reader.readLong(offsets[1]),
    deathDate: reader.readDateTimeOrNull(offsets[2]),
    id: id,
    imagesFiles: reader.readObjectList<ImageEntity>(
          offsets[3],
          ImageEntitySchema.deserialize,
          allOffsets,
          ImageEntity(),
        ) ??
        [],
    isAlive: reader.readBool(offsets[4]),
    name: reader.readString(offsets[5]),
    startDate: reader.readDateTimeOrNull(offsets[6]),
  );
  return object;
}

P _plantEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<ImageEntity>(
            offset,
            ImageEntitySchema.deserialize,
            allOffsets,
            ImageEntity(),
          ) ??
          []) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _plantEntityGetId(PlantEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _plantEntityGetLinks(PlantEntity object) {
  return [];
}

void _plantEntityAttach(
    IsarCollection<dynamic> col, Id id, PlantEntity object) {
  object.id = id;
}

extension PlantEntityQueryWhereSort
    on QueryBuilder<PlantEntity, PlantEntity, QWhere> {
  QueryBuilder<PlantEntity, PlantEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlantEntityQueryWhere
    on QueryBuilder<PlantEntity, PlantEntity, QWhereClause> {
  QueryBuilder<PlantEntity, PlantEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<PlantEntity, PlantEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterWhereClause> idBetween(
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

extension PlantEntityQueryFilter
    on QueryBuilder<PlantEntity, PlantEntity, QFilterCondition> {
  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> addDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      addDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> addDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> addDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      dayIntervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      dayIntervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      dayIntervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      dayIntervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      deathDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deathDate',
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      deathDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deathDate',
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      deathDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deathDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      deathDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deathDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      deathDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deathDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      deathDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deathDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      imagesFilesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesFiles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      imagesFilesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesFiles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      imagesFilesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesFiles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      imagesFilesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesFiles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      imagesFilesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesFiles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      imagesFilesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesFiles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> isAliveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAlive',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      startDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlantEntityQueryObject
    on QueryBuilder<PlantEntity, PlantEntity, QFilterCondition> {
  QueryBuilder<PlantEntity, PlantEntity, QAfterFilterCondition>
      imagesFilesElement(FilterQuery<ImageEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'imagesFiles');
    });
  }
}

extension PlantEntityQueryLinks
    on QueryBuilder<PlantEntity, PlantEntity, QFilterCondition> {}

extension PlantEntityQuerySortBy
    on QueryBuilder<PlantEntity, PlantEntity, QSortBy> {
  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByAddDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addDate', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByAddDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addDate', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByDayInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayInterval', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByDayIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayInterval', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByDeathDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deathDate', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByDeathDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deathDate', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByIsAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAlive', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByIsAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAlive', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension PlantEntityQuerySortThenBy
    on QueryBuilder<PlantEntity, PlantEntity, QSortThenBy> {
  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByAddDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addDate', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByAddDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addDate', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByDayInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayInterval', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByDayIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayInterval', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByDeathDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deathDate', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByDeathDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deathDate', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByIsAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAlive', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByIsAliveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAlive', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension PlantEntityQueryWhereDistinct
    on QueryBuilder<PlantEntity, PlantEntity, QDistinct> {
  QueryBuilder<PlantEntity, PlantEntity, QDistinct> distinctByAddDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addDate');
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QDistinct> distinctByDayInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayInterval');
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QDistinct> distinctByDeathDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deathDate');
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QDistinct> distinctByIsAlive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAlive');
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlantEntity, PlantEntity, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }
}

extension PlantEntityQueryProperty
    on QueryBuilder<PlantEntity, PlantEntity, QQueryProperty> {
  QueryBuilder<PlantEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlantEntity, DateTime, QQueryOperations> addDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addDate');
    });
  }

  QueryBuilder<PlantEntity, int, QQueryOperations> dayIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayInterval');
    });
  }

  QueryBuilder<PlantEntity, DateTime?, QQueryOperations> deathDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deathDate');
    });
  }

  QueryBuilder<PlantEntity, List<ImageEntity>, QQueryOperations>
      imagesFilesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagesFiles');
    });
  }

  QueryBuilder<PlantEntity, bool, QQueryOperations> isAliveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAlive');
    });
  }

  QueryBuilder<PlantEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PlantEntity, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }
}
