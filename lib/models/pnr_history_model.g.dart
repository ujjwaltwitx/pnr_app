// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pnr_history_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPnrHistoryModelCollection on Isar {
  IsarCollection<PnrHistoryModel> get pnrHistoryModels => this.collection();
}

const PnrHistoryModelSchema = CollectionSchema(
  name: r'PnrHistoryModel',
  id: 6070166917830035068,
  properties: {
    r'destination': PropertySchema(
      id: 0,
      name: r'destination',
      type: IsarType.string,
    ),
    r'pnrNum': PropertySchema(
      id: 1,
      name: r'pnrNum',
      type: IsarType.long,
    ),
    r'source': PropertySchema(
      id: 2,
      name: r'source',
      type: IsarType.string,
    )
  },
  estimateSize: _pnrHistoryModelEstimateSize,
  serialize: _pnrHistoryModelSerialize,
  deserialize: _pnrHistoryModelDeserialize,
  deserializeProp: _pnrHistoryModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pnrHistoryModelGetId,
  getLinks: _pnrHistoryModelGetLinks,
  attach: _pnrHistoryModelAttach,
  version: '3.1.0+1',
);

int _pnrHistoryModelEstimateSize(
  PnrHistoryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.destination;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.source;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pnrHistoryModelSerialize(
  PnrHistoryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.destination);
  writer.writeLong(offsets[1], object.pnrNum);
  writer.writeString(offsets[2], object.source);
}

PnrHistoryModel _pnrHistoryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PnrHistoryModel();
  object.destination = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.pnrNum = reader.readLongOrNull(offsets[1]);
  object.source = reader.readStringOrNull(offsets[2]);
  return object;
}

P _pnrHistoryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pnrHistoryModelGetId(PnrHistoryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pnrHistoryModelGetLinks(PnrHistoryModel object) {
  return [];
}

void _pnrHistoryModelAttach(
    IsarCollection<dynamic> col, Id id, PnrHistoryModel object) {
  object.id = id;
}

extension PnrHistoryModelQueryWhereSort
    on QueryBuilder<PnrHistoryModel, PnrHistoryModel, QWhere> {
  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PnrHistoryModelQueryWhere
    on QueryBuilder<PnrHistoryModel, PnrHistoryModel, QWhereClause> {
  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterWhereClause>
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

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterWhereClause> idBetween(
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

extension PnrHistoryModelQueryFilter
    on QueryBuilder<PnrHistoryModel, PnrHistoryModel, QFilterCondition> {
  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destination',
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destination',
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destination',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destination',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      destinationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
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

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
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

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
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

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      pnrNumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pnrNum',
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      pnrNumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pnrNum',
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      pnrNumEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pnrNum',
        value: value,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      pnrNumGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pnrNum',
        value: value,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      pnrNumLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pnrNum',
        value: value,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      pnrNumBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pnrNum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }
}

extension PnrHistoryModelQueryObject
    on QueryBuilder<PnrHistoryModel, PnrHistoryModel, QFilterCondition> {}

extension PnrHistoryModelQueryLinks
    on QueryBuilder<PnrHistoryModel, PnrHistoryModel, QFilterCondition> {}

extension PnrHistoryModelQuerySortBy
    on QueryBuilder<PnrHistoryModel, PnrHistoryModel, QSortBy> {
  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy>
      sortByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy>
      sortByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy> sortByPnrNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pnrNum', Sort.asc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy>
      sortByPnrNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pnrNum', Sort.desc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy>
      sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }
}

extension PnrHistoryModelQuerySortThenBy
    on QueryBuilder<PnrHistoryModel, PnrHistoryModel, QSortThenBy> {
  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy>
      thenByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy>
      thenByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy> thenByPnrNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pnrNum', Sort.asc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy>
      thenByPnrNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pnrNum', Sort.desc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QAfterSortBy>
      thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }
}

extension PnrHistoryModelQueryWhereDistinct
    on QueryBuilder<PnrHistoryModel, PnrHistoryModel, QDistinct> {
  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QDistinct>
      distinctByDestination({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destination', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QDistinct> distinctByPnrNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pnrNum');
    });
  }

  QueryBuilder<PnrHistoryModel, PnrHistoryModel, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }
}

extension PnrHistoryModelQueryProperty
    on QueryBuilder<PnrHistoryModel, PnrHistoryModel, QQueryProperty> {
  QueryBuilder<PnrHistoryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PnrHistoryModel, String?, QQueryOperations>
      destinationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destination');
    });
  }

  QueryBuilder<PnrHistoryModel, int?, QQueryOperations> pnrNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pnrNum');
    });
  }

  QueryBuilder<PnrHistoryModel, String?, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }
}
